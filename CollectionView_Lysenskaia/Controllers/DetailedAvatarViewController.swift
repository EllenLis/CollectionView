//
//  DetailedAvatarViewController.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 04.11.2022.
//

import UIKit

class DetailedAvatarViewController: UIViewController {

    private lazy var alphaView: UIView = {
        let view = UIView()
        view.alpha = 0.9
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var detailAvatarImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2-1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.addTarget(self, action: #selector(self.didTapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let screenWidth = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(alphaView)
        view.addSubview(closeButton)
        view.addSubview(detailAvatarImage)
        view.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            detailAvatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailAvatarImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            detailAvatarImage.heightAnchor.constraint(equalToConstant: screenWidth),
            detailAvatarImage.widthAnchor.constraint(equalToConstant: screenWidth),
            
            alphaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            alphaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func didTapCloseButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

