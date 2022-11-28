//
//  DetailedPhotoViewController.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 09.11.2022.
//

import UIKit

class DetailedPhotoViewController: UIViewController {

    var selectedImage: String?

    private lazy var alphaView: UIView = {
        let view = UIView()
        view.alpha = 0.8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var detailedPhotoImage: UIImageView = {
        let imageView = UIImageView()
        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(alphaView)
        self.navigationItem.backButtonTitle = "Back"
        view.addSubview(detailedPhotoImage)
        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            detailedPhotoImage.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            detailedPhotoImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            detailedPhotoImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            alphaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            alphaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    @objc private func didTapCloseButton() {
        dismiss(animated: true)
    }
}

