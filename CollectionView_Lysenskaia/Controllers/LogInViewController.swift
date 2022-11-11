//
//  LogInViewController.swift
//  CollectionView_Lysenskaia
//
//  Created by ElenaL on 27.10.2022.
//

import UIKit

class LogInViewController: UIViewController, UIScrollViewDelegate {
    
    private var login = "login@ya.ru"
    private var password = "passw"
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
       
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var logoView: UIImageView = {
        let logoView = UIImageView(image: UIImage(named: "logo.png"))
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    
    private lazy var initStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = -0.5
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10.0
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.clipsToBounds = true
        textField.placeholder = "E-mail or phone"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16.0)
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 2.0))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.clipsToBounds = true
        textField.placeholder = "Password"
        return textField
    }()
    
    private lazy var labelAlert: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.alpha = 0
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .systemRed
        label.textAlignment = .center
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.systemRed.cgColor
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var initButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        let image = UIImage(named: "blue_pixel.png")
        button.setBackgroundImage(image, for: .normal)
        if button.isSelected {
            button.alpha = 0.8
        } else if button.isHighlighted {
            button.alpha = 0.8
        } else {
            button.alpha = 1.0
        }
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        setupView()
        setupConstraints()
       
        setupLabelAlert()
        self.scrollView.delegate = self
    }
    
    func setupView() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(logoView)
        self.contentView.addSubview(initStackView)
        self.initStackView.addArrangedSubview(textStackView)
        self.textStackView.addArrangedSubview(loginTextField)
        self.textStackView.addArrangedSubview(passwordTextField)
        self.initStackView.addArrangedSubview(initButton)
        navigationController?.navigationBar.isHidden = true
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            
            initStackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            initStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            initStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            initStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            initButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func setupLabelAlert() {
        self.contentView.addSubview(labelAlert)

        NSLayoutConstraint.activate([
            labelAlert.topAnchor.constraint(equalTo: self.initButton.bottomAnchor, constant: 20),
            labelAlert.leadingAnchor.constraint(equalTo: self.textStackView.leadingAnchor),
            labelAlert.trailingAnchor.constraint(equalTo: self.textStackView.trailingAnchor),
            labelAlert.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonAction() {
        let profile = ProfileViewController()
        
        if self.passwordTextField.text?.count ?? 0 < password.count {
            labelAlert.alpha = 1
            labelAlert.text = "Количество символов пароля меньше верного"

        } else if self.passwordTextField.text?.count ?? 0 > password.count {
            labelAlert.alpha = 1
            labelAlert.text = "Количество символов пароля больше верного"

        } else {
            labelAlert.alpha = 0
        }

        self.passwordTextField.backgroundColor = .systemGray6
        self.loginTextField.backgroundColor = .systemGray6
        if self.loginTextField.text == "" && self.passwordTextField.text != "" {
            self.loginTextField.backgroundColor = .red
        } else if self.loginTextField.text != "" && self.passwordTextField.text == "" {
            self.passwordTextField.backgroundColor = .red

        } else if self.loginTextField.text == "" && self.passwordTextField.text == "" {
            self.passwordTextField.backgroundColor = .red
            self.loginTextField.backgroundColor = .red
        }

        if self.loginTextField.text == login && self.passwordTextField.text == password {
            navigationController?.pushViewController(profile, animated: true)
            
        } else if isValidEmail(self.loginTextField.text!) != true {
            let alertController = UIAlertController(title: "Access denied!",
                                                    message: "E-mail is invalid!",
                                                    preferredStyle: .alert)

            let actionOK = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: {(action:UIAlertAction!) in
                print("OK Was pressed!")
            })

            let actionCancel = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: {(action:UIAlertAction!) in
                print("Cancel was pressed!")
            })

            alertController.addAction(actionOK)
            alertController.addAction(actionCancel)

            self.present(alertController, animated: true, completion: nil)

        }
            
         else if self.loginTextField.text != login && self.passwordTextField.text != password {
            let alertController = UIAlertController(title: "Access denied!",
                                                    message: "Login and password are incorrect!",
                                                    preferredStyle: .alert)

            let actionOK = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: {(action:UIAlertAction!) in
                print("OK Was pressed!")
            })

            let actionCancel = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: {(action:UIAlertAction!) in
                print("Cancel was pressed!")
            })

            alertController.addAction(actionOK)
            alertController.addAction(actionCancel)

            self.present(alertController, animated: true, completion: nil)
        } else if self.loginTextField.text == login && self.passwordTextField.text != password {
            let alertController = UIAlertController(title: "Access denied!",
                                                    message: "Password is incorrect!",
                                                    preferredStyle: .alert)

            let actionOK = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: {(action:UIAlertAction!) in
                print("OK Was pressed!")
            })

            let actionCancel = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: {(action:UIAlertAction!) in
                print("Cancel was pressed!")
            })

            alertController.addAction(actionOK)
            alertController.addAction(actionCancel)

            self.present(alertController, animated: true, completion: nil)

        } else if self.loginTextField.text != login && self.passwordTextField.text == password {
            let alertController = UIAlertController(title: "Access denied!",
                                                    message: "Login is incorrect!",
                                                    preferredStyle: .alert)

            let actionOK = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: {(action:UIAlertAction!) in
                print("OK Was pressed!")
            })

            let actionCancel = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: {(action:UIAlertAction!) in
                print("Cancel was pressed!")
            })

            alertController.addAction(actionOK)
            alertController.addAction(actionCancel)

            self.present(alertController, animated: true, completion: nil)

        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        tapGesturt()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        let heightOfContent = textStackView.bounds.height + initButton.bounds.height + initButton.bounds.height + 256
        scrollView.contentInset.bottom = kbdSize.height
        scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)

        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let frame = self.view.safeAreaLayoutGuide.layoutFrame
            let contentOffset: CGPoint = notification.name == UIResponder.keyboardWillHideNotification ? .zero: CGPoint(x: 0, y: heightOfContent - keyboardHeight)
            if heightOfContent + keyboardHeight >= frame.height {
                self.scrollView.contentOffset = contentOffset
            }
        }
    }
}

    @objc private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
}

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
    }
}



    

extension LogInViewController: UITextFieldDelegate {
        
        func tapGesturt() {
                let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
                view.addGestureRecognizer(tapGesture)
            }
        
    }

