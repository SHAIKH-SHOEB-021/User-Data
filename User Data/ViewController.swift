//
//  ViewController.swift
//  User Data
//
//  Created by shoeb on 10/01/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GetApiRequestDelegate {
    
    var tableViewUI : UITableView!
    var users : [UserDataModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadApi()
    }
    
    func loadApi() {
        let parse = GetApiRequest()
        parse.getData()
        parse.delegate = self
    }
    
    func loadTableView() {
        tableViewUI = UITableView()
        tableViewUI.translatesAutoresizingMaskIntoConstraints = false
        tableViewUI.delegate = self
        tableViewUI.dataSource = self
        tableViewUI.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        view.addSubview(tableViewUI)
        NSLayoutConstraint.activate([
            tableViewUI.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewUI.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        let user = users[indexPath.row]
        tableViewCell.textName.text = user.name
        tableViewCell.textID.text = "\(user.id!)"
        return tableViewCell
    }
    
    func didReceivedUsers(users: [UserDataModel]) {
        self.users = users
        loadTableView()
    }
    
    func didReceivedError() {
        print("There is an error")
    }
    
}

