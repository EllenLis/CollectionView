//
//  ProfileHeaderView.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private lazy var statusText: String = ""
    
    var avatarImageViewLeadingAnchor: NSLayoutConstraint?
    var avatarImageViewTopAnchor: NSLayoutConstraint?
    var avatarImageViewWidthAnchor: NSLayoutConstraint?
    var avatarImageViewHeightAnchor: NSLayoutConstraint?
    
    var avatarContentView: UIView = {
        let avatarContentView = UIView()
        avatarContentView.translatesAutoresizingMaskIntoConstraints = false
        avatarContentView.alpha = 0
        avatarContentView.backgroundColor = .black
        return avatarContentView
    }()

     lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView(image: UIImage(named: "2-1"))
        avatarImageView.layer.cornerRadius = 70
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.contentsGravity = .resizeAspectFill
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Cute Cat"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.setTitle("Поменять статус", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 12.0
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self,
                               action: #selector(buttonPressed),
                               for: .touchUpInside)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()

    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .white
        statusTextField.font = UIFont.systemFont(ofSize: 15)
        statusTextField.placeholder = "Введите новый статус"
       
        statusTextField.keyboardType = UIKeyboardType.default
        statusTextField.returnKeyType = UIReturnKeyType.done
        statusTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        statusTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        statusTextField.textColor = .black
        
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.addTarget(self,
                            action: #selector(statusTextChanged),
                            for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something"
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.textColor = .gray
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let text = textField.text else {return}
        statusText = text
    }
    
    @objc func buttonPressed(sender: UIButton) {
        statusLabel.text = statusText
        print(statusLabel.text ?? "nil")
    }
    
    private func setupUI() {
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(avatarContentView)
        addSubview(avatarImageView)
        
        avatarImageView.isUserInteractionEnabled = true
        
        avatarImageViewLeadingAnchor = avatarImageView.leadingAnchor.constraint(
            equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        avatarImageViewLeadingAnchor?.isActive = true
        
        avatarImageViewTopAnchor = avatarImageView.topAnchor.constraint(
                    equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        avatarImageViewTopAnchor?.isActive = true
        
        avatarImageViewWidthAnchor = avatarImageView.widthAnchor.constraint(
                    equalToConstant: 140)
        avatarImageViewWidthAnchor?.isActive = true
        
        avatarImageViewHeightAnchor = avatarImageView.heightAnchor.constraint(
                    equalToConstant: 140)
        avatarImageViewHeightAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            
            setStatusButton.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.safeAreaLayoutGuide.trailingAnchor.constraint(
                equalTo: setStatusButton.trailingAnchor, constant: 16),
            setStatusButton.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            setStatusButton.heightAnchor.constraint(
                equalToConstant: 50),
            
            fullNameLabel.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 186),
            fullNameLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            
            statusLabel.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 186),
            statusLabel.topAnchor.constraint(
                equalTo: fullNameLabel.bottomAnchor, constant: 30),
            statusLabel.heightAnchor.constraint(equalToConstant: 15),
            
            statusTextField.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 186),
            statusTextField.topAnchor.constraint(
                equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(
                equalToConstant: 40),
            self.safeAreaLayoutGuide.trailingAnchor.constraint(
                equalTo: statusTextField.trailingAnchor, constant: 16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
}
