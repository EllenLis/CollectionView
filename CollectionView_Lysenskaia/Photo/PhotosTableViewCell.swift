//
//  PhotosTableViewCell.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var photoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Photos"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var rightArrow: UIImageView = {
        let rightArrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView()
        imageView.image = rightArrow
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var photoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private lazy var firstPhotoView: UIImageView = {
        let image = UIImage(named: "1")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var secondPhotoView: UIImageView = {
        let image = UIImage(named: "2")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var thirdPhotoView: UIImageView = {
        let image = UIImage(named: "3")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var fourthPhotoView: UIImageView = {
        let image = UIImage(named: "4")
        let imageView = UIImageView()
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        contentView.addSubview(backView)
        backView.addSubview(photoLabel)
        backView.addSubview(rightArrow)
        backView.addSubview(photoStackView)
        photoStackView.addArrangedSubview(firstPhotoView)
        photoStackView.addArrangedSubview(secondPhotoView)
        photoStackView.addArrangedSubview(thirdPhotoView)
        photoStackView.addArrangedSubview(fourthPhotoView)

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            photoLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 12),
            photoLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 12),

            rightArrow.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            rightArrow.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),
            rightArrow.heightAnchor.constraint(equalTo: photoLabel.heightAnchor),
            rightArrow.widthAnchor.constraint(equalTo: rightArrow.heightAnchor, multiplier: 1),

            photoStackView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -12),
            photoStackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 12),
            photoStackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -12),

            firstPhotoView.heightAnchor.constraint(equalTo: firstPhotoView.widthAnchor, multiplier: 1)
        ])
    }
}
