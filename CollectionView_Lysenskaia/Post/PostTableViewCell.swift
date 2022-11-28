//
//  PostTableViewCell.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var likedDelegate: TapLikedDelegate?
    
    struct ViewModel {
        let author: String
        let image: String
        let description: String
        var likes: Int
        var views: Int
    }
    
    private let tapLike = UITapGestureRecognizer()
    
    private let contentProfileView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackViewPost: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var stackViewLikesViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 120
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        image.heightAnchor.constraint(equalTo: image.widthAnchor).isActive = true
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
    
    
    lazy var contentLikesLabel : UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.textColor = .black
        likes.backgroundColor = .clear
        likes.font = UIFont(name: "System", size: 16)
        return likes
    }()
    
    private var contentViewsLabel : UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont(name: "System", size: 14)
        views.textColor = .black
        return views
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        self.setupGestureLikeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.contentAuthorLabel.text = nil
        self.contentImageView.image = nil
        self.contentDescriptionLabel.text = nil
        self.contentLikesLabel.text = nil
        self.contentViewsLabel.text = nil
    }

    private func layout() {
        
        contentView.backgroundColor = .white
                contentView.addSubview(contentProfileView)
                contentProfileView.addSubview(stackViewPost)
                stackViewPost.addArrangedSubview(contentAuthorLabel)
                stackViewPost.addArrangedSubview(contentImageView)
                stackViewPost.addArrangedSubview(contentDescriptionLabel)
                stackViewPost.addArrangedSubview(stackViewLikesViews)
                stackViewLikesViews.addArrangedSubview(contentLikesLabel)
                stackViewLikesViews.addArrangedSubview(contentViewsLabel)
                stackViewPost.backgroundColor = .white
        
                NSLayoutConstraint.activate([
                    contentProfileView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    contentProfileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    contentProfileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    contentProfileView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
                    stackViewPost.topAnchor.constraint(equalTo: contentProfileView.topAnchor, constant: 6),
                    stackViewPost.leadingAnchor.constraint(equalTo: contentProfileView.leadingAnchor, constant: 16),
                    stackViewPost.trailingAnchor.constraint(equalTo: contentProfileView.trailingAnchor, constant: -16),
                    stackViewPost.bottomAnchor.constraint(equalTo: contentProfileView.bottomAnchor, constant: -6)
                    ])
        
    }
    
    func setup(with viewModel: ViewModel) {
            self.contentAuthorLabel.text = viewModel.author
            self.contentImageView.image = UIImage(named: viewModel.image)
            self.contentDescriptionLabel.text = viewModel.description
            self.contentLikesLabel.text = "Likes: " + String(viewModel.likes)
            self.contentViewsLabel.text = "Views: " + String(viewModel.views)
        }
    
    private func setupGestureLikeLabel() {

        self.contentLikesLabel.addGestureRecognizer(tapLike)
        self.tapLike.addTarget(self, action: #selector(self.tapLiked(_:)))
        self.tapLike.view?.isUserInteractionEnabled = true
        
    }
    
    @objc func tapLiked(_ gestureRecognizer: UITapGestureRecognizer) {
        
        guard let newCount = Int((self.contentLikesLabel.text!.dropFirst(7))) else {return}
        self.contentLikesLabel.text = "Likes: \(newCount + 1)"
        likedDelegate?.tapLikedLabel(cell: self)
        
    }

}
    
    
 
