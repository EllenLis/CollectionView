//
//  PostViewController.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "My Posts"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
        navigationItem.title = "Пост"
        navigationItem.title = titlePost
        viewdidTapButton()
    }
            
    func viewdidTapButton() {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "info.circle")
        barButton.action = #selector(didTapButton)
        barButton.target = self
        self.navigationItem.setLeftBarButton(barButton, animated: true) }
               
            
    @objc func didTapButton() {
        let vc = InfoViewController()
        vc.title = "Информация"
        vc.view.backgroundColor = .lightGray

        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
