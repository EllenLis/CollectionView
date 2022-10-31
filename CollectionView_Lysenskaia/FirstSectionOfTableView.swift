//
//  FirstSectionOfTableView.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 31.10.2022.
//

import UIKit

class FirstSectionOfTableView: UITableViewCell {

    let headerTitle: UILabel = {
        let headerTitle = UILabel()
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.numberOfLines = 1
        headerTitle.text = "Photos"
        headerTitle.textColor = .black
        headerTitle.font = UIFont.boldSystemFont(ofSize: 24)
        return headerTitle
    }()
    
    let arrowImage: UIImageView = {
        let arrowImage = UIImageView(image: UIImage(systemName: "arrow.right"))
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.tintColor = .black
        return arrowImage
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray5
        
        contentView.addSubview(headerTitle)
        contentView.addSubview(arrowImage)

        NSLayoutConstraint.activate([
            headerTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0),
            headerTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0),
            headerTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),


            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowImage.centerYAnchor.constraint(equalTo: headerTitle.centerYAnchor),
            arrowImage.heightAnchor.constraint(equalToConstant: 24.0),
            arrowImage.widthAnchor.constraint(equalToConstant: 24.0)
            
        ])
        
    }
}

