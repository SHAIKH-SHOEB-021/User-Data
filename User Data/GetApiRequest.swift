//
//  GetApiRequest.swift
//  User Data
//
//  Created by shoeb on 10/01/23.
//

import UIKit

protocol GetApiRequestDelegate : NSObjectProtocol{
    func didReceivedUsers( users : [UserDataModel])
    func didReceivedError()
}

class GetApiRequest: NSObject, URLSessionDownloadDelegate, URLSessionDelegate {
    var webData : Data?
    weak var delegate : GetApiRequestDelegate? // weak since its call will be executed in the controller class not where the varaible is declared
    var session : URLSession{
        let defualtConfig = URLSessionConfiguration.default
        defualtConfig.requestCachePolicy =  NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        let session1 = URLSession(configuration: defualtConfig, delegate: self, delegateQueue: nil)
        return session1
    }
    
    func getData(){
        let url = URL(string: "https://gorest.co.in/public/v2/users")
        let task = session.downloadTask(with: url!)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        do{
            webData = try Data(contentsOf: location)
            //let responseString = String(data: webData!, encoding: String.Encoding.utf8)
            //print("responseString \(responseString!)")
            
            let data = try JSONSerialization.jsonObject(with: webData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String : Any]]
            
            var users : [UserDataModel] = []
            
            for i in 0..<data.count {
                let user = UserDataModel(ditionary: data[i])
                users.append(user)
            }
            DispatchQueue.main.async {
                self.delegate?.didReceivedUsers(users: users)
            }
            
            
        }catch{
            delegate?.didReceivedError()
            print("Error")
            
        }
    }
}
