//
//  ViewController.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var buttonStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.spacing = 10

            return stackView
        }()

        private lazy var firstButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemMint
            button.layer.cornerRadius = 12
            button.setTitle("Перейти на пост", for: .normal)
            button.setTitleColor(.systemGray6, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        private lazy var secondButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 12
            button.setTitle("Перейти на пост", for: .normal)
            button.setTitleColor(.systemGray6, for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Новости"
            setupNavigationBar()
            setButtonStackView()
        }

        private func setupNavigationBar() {
            view.backgroundColor = .systemGray6
            self.navigationItem.title = "Лента"
           }

        func setButtonStackView() {
            self.view.addSubview(self.buttonStackView)
            self.buttonStackView.addArrangedSubview(firstButton)
            self.buttonStackView.addArrangedSubview(secondButton)
            
            NSLayoutConstraint.activate([
                buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                firstButton.heightAnchor.constraint(equalToConstant: 50),
                secondButton.heightAnchor.constraint(equalToConstant: 50)
            ])

        }

        @objc private func buttonPressed() {
            let postViewController = PostViewController()
            self.navigationController?.pushViewController(postViewController, animated: true)
        }

}

