//
//  UserDataModel.swift
//  User Data
//
//  Created by shoeb on 10/01/23.
//

import UIKit

class UserDataModel: NSObject {
    
    var id : Int?
    var name : String?
    var email : String?
    var gender : String?
    var status : String?
    
    init(ditionary : [String : Any]) {
        super.init()
        id = ditionary["id"] as? Int
        name = ditionary["name"] as? String
        email = ditionary["email"] as? String
        gender = ditionary["gender"] as? String
        status = ditionary["status"] as? String
    }
 
}
