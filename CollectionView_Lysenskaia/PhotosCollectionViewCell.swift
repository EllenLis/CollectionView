//
//  PhotosCollectionViewCell.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var photoImagesToGallery: UIImageView = {
        let photoImagesToGallery = UIImageView()
        photoImagesToGallery.clipsToBounds = true
        photoImagesToGallery.translatesAutoresizingMaskIntoConstraints = false
        
        return photoImagesToGallery
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backView)
        backView.addSubview(photoImagesToGallery)
        
        
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            photoImagesToGallery.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            photoImagesToGallery.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            photoImagesToGallery.heightAnchor.constraint(equalTo: backView.heightAnchor),
            photoImagesToGallery.widthAnchor.constraint(equalTo: backView.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
