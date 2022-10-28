//
//  ProfileViewController.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {

        private lazy var profileTableView: UITableView = {
            let profileTableView = UITableView(frame: .zero, style: .grouped)
            profileTableView.rowHeight = UITableView.automaticDimension
            profileTableView.estimatedRowHeight = 44
            profileTableView.dataSource = self
            profileTableView.delegate = self
            profileTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
            profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
            profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
            profileTableView.backgroundColor = .systemGray6
            profileTableView.layer.borderColor = UIColor.lightGray.cgColor
            profileTableView.layer.borderWidth = 0.5
            profileTableView.translatesAutoresizingMaskIntoConstraints = false
            return profileTableView
        }()
    
    let massivFeed = Post.postFeed()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(profileTableView)
        setupNavigationBar()
        
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.isHidden = true

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = .systemGray6
        navBarAppearance.shadowImage = nil
        navBarAppearance.shadowColor = nil
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
}

extension ProfileViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return massivFeed.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            return cell
        } else {
        guard let cell = profileTableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else { let cell = profileTableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        return cell
    }
        let article = massivFeed[indexPath.row - 1]
        let postModel = Post(author: article.author,
                             description: article.description,
                             image: article.image,
                             likes: article.likes,
                             views: article.views)
        cell.setup(postModel)
        return cell
    }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
            self.navigationItem.backButtonTitle = "Back"
            title = "Photo"
        } else { return }
        
    }
    
}

    
