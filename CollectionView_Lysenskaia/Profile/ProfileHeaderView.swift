//
//  ProfileHeaderView.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    lazy var profileImageView : UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "2-1.jpeg")
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 70
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.masksToBounds = true
        profileImageView.isUserInteractionEnabled = true
        return profileImageView
    }()
    
    private lazy var userNameLabel : UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.text = "Cute Cat"
        userNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        userNameLabel.textColor = .black
        userNameLabel.clipsToBounds = true
        return userNameLabel
    }()
    
    private lazy var statusLabel : UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.numberOfLines = 2
        return statusLabel
    }()
    
    private lazy var statusTextField : UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .white
        statusTextField.placeholder = "Введите новый статус"
        statusTextField.returnKeyType = .done
        statusTextField.autocapitalizationType = .words
        statusTextField.font = .systemFont(ofSize: 15)
        statusTextField.textColor = .systemGray2
        statusTextField.backgroundColor = .systemGray4
        statusTextField.borderStyle = .roundedRect
        statusTextField.returnKeyType = .next
        statusTextField.keyboardType = .default
        statusTextField.clearButtonMode = .always
        return statusTextField
    }()
    
    private lazy var statusButton : UIButton = {
        let statusButton =  UIButton()
        statusButton.setTitle("Поменять статус", for: .normal)
        statusButton.backgroundColor = .blue
        statusButton.layer.cornerRadius = 4
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        
        return statusButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapKeyboardOff(_:)))
        self.addGestureRecognizer(tap)
        
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(statusTextField)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(statusButton)
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 140),
            profileImageView.heightAnchor.constraint(equalToConstant: 140),
            
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            statusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 46),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -16),
            statusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func tapKeyboardOff(_ sender: Any) {
        statusTextField.resignFirstResponder()
    }

    @objc private func buttonPressed() {
        guard let status = statusTextField.text else {return}
        if !status.isEmpty {
            UIView.animate(withDuration: 0.5) {
                self.statusLabel.text = self.statusTextField.text
                self.statusTextField.text = .none
            } completion: { _ in
            }
        }
        if status.isEmpty {
            statusTextField.shake()
        }
        endEditing(true)
    }

}

extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
