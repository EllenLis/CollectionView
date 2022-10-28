//
//  PostTableViewCell.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let contentProfileView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentAuthorLabel : UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = .systemFont(ofSize: 20, weight: .bold)
        author.textColor = .black
        author.numberOfLines = 2
        return author
    }()
    
    private let contentImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()
    
    private let contentDescriptionLabel : UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = .systemFont(ofSize: 14, weight: .regular)
        description.textColor = .systemGray
        description.numberOfLines = 0
        return description
    }()
    
    
    private let contentLikesLabel : UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = .systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        return likes
    }()
    
    private let contentViewsLabel : UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = .systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        return views
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customizeCell()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func customizeCell() {
        contentView.backgroundColor = .systemGray6
    }
    
    func setup (_ post: Post) {
        contentAuthorLabel.text = post.author
        contentImageView.image = UIImage(named: post.image)
        contentDescriptionLabel.text = post.description
        contentLikesLabel.text = "Likes: \(String(post.likes))"
        contentViewsLabel.text = "Views: \(String(post.views))"
    }
    
    private func layout() {
        
        contentView.addSubview(contentProfileView)
        
        [contentAuthorLabel, contentDescriptionLabel, contentImageView, contentLikesLabel, contentViewsLabel].forEach {contentProfileView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            contentProfileView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentProfileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentProfileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentProfileView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentAuthorLabel.topAnchor.constraint(equalTo: contentProfileView.topAnchor, constant: 16),
            contentAuthorLabel.leadingAnchor.constraint(equalTo: contentProfileView.leadingAnchor, constant: 16),
            contentAuthorLabel.trailingAnchor.constraint(equalTo: contentProfileView.trailingAnchor, constant: -16),
            
            contentImageView.topAnchor.constraint(equalTo: contentAuthorLabel.bottomAnchor, constant: 12),
            contentImageView.leadingAnchor.constraint(equalTo: contentProfileView.leadingAnchor),
            contentImageView.trailingAnchor.constraint(equalTo: contentProfileView.trailingAnchor),
            contentImageView.heightAnchor.constraint(equalTo: contentImageView.widthAnchor),
            contentImageView.widthAnchor.constraint(equalTo: contentProfileView.widthAnchor),
            
            contentDescriptionLabel.topAnchor.constraint(equalTo: contentImageView.bottomAnchor, constant: 16),
            contentDescriptionLabel.leadingAnchor.constraint(equalTo: contentProfileView.leadingAnchor, constant: 16),
            contentDescriptionLabel.trailingAnchor.constraint(equalTo: contentProfileView.trailingAnchor, constant: -16),
            
            contentLikesLabel.topAnchor.constraint(equalTo: contentDescriptionLabel.bottomAnchor, constant: 16),
            contentLikesLabel.leadingAnchor.constraint(equalTo: contentProfileView.leadingAnchor, constant: 16),
            contentLikesLabel.bottomAnchor.constraint(equalTo: contentProfileView.bottomAnchor, constant: -16),
            contentLikesLabel.widthAnchor.constraint(equalTo: contentViewsLabel.widthAnchor),
            
            contentViewsLabel.topAnchor.constraint(equalTo: contentDescriptionLabel.bottomAnchor, constant: 16),
            contentViewsLabel.trailingAnchor.constraint(equalTo: contentProfileView.trailingAnchor, constant: -16),
            contentViewsLabel.bottomAnchor.constraint(equalTo: contentProfileView.bottomAnchor, constant: -16),
        ])
        
    }

}
