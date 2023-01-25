//
//  CustomTableViewCell.swift
//  User Data
//
//  Created by shoeb on 10/01/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var textID : UILabel!
    var textName : UILabel!

    static let identifier = "CustomTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBrown
        
        textID = UILabel()
        textID.translatesAutoresizingMaskIntoConstraints = false
        textID.textColor = .white
        //textID.text = "123"
        contentView.addSubview(textID)
        NSLayoutConstraint.activate([
            textID.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textID.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textID.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            //textID.bottomAnchor.constraint(equalTo: textName.bottomAnchor, constant: -10)
        ])
        
        textName = UILabel()
        textName.translatesAutoresizingMaskIntoConstraints = false
        textName.textColor = .white
        //textName.text = "Hello World"
        contentView.addSubview(textName)
        NSLayoutConstraint.activate([
            textName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textName.topAnchor.constraint(equalTo: textID.topAnchor, constant: 20),
            textName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
