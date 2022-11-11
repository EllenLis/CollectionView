//
//  ProfileViewController.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class ProfileViewController: UIViewController, TapLikedDelegate {
    
    private let profileHeaderView = ProfileHeaderView()
    private let detailAvatarView: DetailAvatarView = {
        let avatarView = DetailAvatarView()
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        return avatarView
    }()

    var liked: Bool = false

        private lazy var profileTableView: UITableView = {
            let profileTableView = UITableView(frame: .zero, style: .grouped)
            profileTableView.rowHeight = UITableView.automaticDimension
            profileTableView.estimatedRowHeight = 44
            profileTableView.dataSource = self
            profileTableView.delegate = self
            profileTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
            profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
            profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
            profileTableView.backgroundColor = .systemGray6
            profileTableView.layer.borderColor = UIColor.lightGray.cgColor
            profileTableView.layer.borderWidth = 0.5
            profileTableView.translatesAutoresizingMaskIntoConstraints = false
            return profileTableView
        }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(profileTableView)
        setupNavigationBar()
        self.setupView()
        self.addDataSource()
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.backButtonTitle = "Back"
        self.setupGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func tapLikedLabel() {
        liked.toggle()
        self.profileTableView.reloadData()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Profile"
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        view.addSubview(detailAvatarView)

        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            detailAvatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailAvatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailAvatarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailAvatarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailAvatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func addDataSource() {
        dataSource.append(.init(author: "Cathedrals", description: "Saint Isaac's Cathedral or Isaakievskiy Sobor is a large architectural landmark cathedral that currently functions as a museum with occasional church services in Saint Petersburg, Russia. It is dedicated to Saint Isaac of Dalmatia, a patron saint of Peter the Great, who had been born on the feast day of that saint.", image: "IMG_1", id: "01", likes: 220, views: 540))
        dataSource.append(.init(author: "Museums", description: "The State Hermitage Museum is a museum of art and culture in Saint Petersburg, Russia. It is the largest art museum in the world by gallery space.", image: "IMG_2.jpg", id: "02", likes: 315, views: 550))
        dataSource.append(.init(author: "Art", description: "Facing the Gulf of Finland, Petergof is known for the sprawling Peterhof Museum Complex, home to the 18th-century Grand Palace, elaborately landscaped gardens, and spectacular fountains with statues.", image: "IMG_3.jpeg", id: "03", likes: 125, views: 365))
        dataSource.append(.init(author: "Bridges", description: "Palace Bridge, a road- and foot-traffic bascule bridge, spans the Neva River in Saint Petersburg between Palace Square and Vasilievsky Island.", image: "IMG-4", id: "04", likes: 115, views: 205))

    }

    private func setupGesture() {
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_ :)))
        profileHeaderView.profileImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        UIView.animate(withDuration: 0.5) {
            self.detailAvatarView.alpha = 1
        }
    }

    func presentDetailedAvatarViewController() {
        let secondViewController = DetailedAvatarViewController()
        secondViewController.transitioningDelegate = self
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true)
    }
    
}

extension ProfileViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            cell.likedDelegate = self

            if liked {
                dataSource[indexPath.row - 1].likes += 1
                liked.toggle()
            }

            let article = dataSource[indexPath.row - 1]
            let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                        image: article.image,
                                                        description: article.description,
                                                        likes: article.likes,
                                                        views: article.views)
            cell.setup(with: viewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return profileHeaderView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else {
            let viewController = DetailPostViewController()
            viewController.selectedDataImage = dataSource[indexPath.row - 1].image
            viewController.selectedDataLikes = dataSource[indexPath.row - 1].likes
            viewController.selectedDataViews = dataSource[indexPath.row - 1].views + 1
            viewController.selectedDataAuthor = dataSource[indexPath.row - 1].author
            viewController.selectedDataDescription = dataSource[indexPath.row - 1].description
            viewController.selectedId = dataSource[indexPath.row - 1].id
            dataSource[indexPath.row - 1].views += 1
            self.profileTableView.reloadRows(at: [indexPath], with: .none)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.row != 0 {
            let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") {
                (contextualAction, view, boolValue) in
                dataSource.remove(at: indexPath.row - 1)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
            return swipeActions
        }
        else { return nil }
    }
    
}

extension ProfileViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AvatarTransitionAnimator(presentationImageView: profileHeaderView.profileImageView, isPresenting: true)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AvatarTransitionAnimator(presentationImageView: profileHeaderView.profileImageView, isPresenting: false)
    }
}

    
