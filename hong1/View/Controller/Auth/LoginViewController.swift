//
//  LoginViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/23/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let tagLineLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium16Font
        label.textColor = UIColor.colorc7c7c7
        label.text = "긍정적인 마케팅의 시작"
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.font = .ptExtraBold30Font
        label.textColor = UIColor.color242424
        label.text = "꿀잼 AD 로그인"
        return label
    }()

    
    private let idTextField: DesignableUITextField = {
        let textField = DesignableUITextField()
        textField.placeholder = "아이디 입력"
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        textField.layer.masksToBounds = false
        
        // Shadow properties for a soft, subtle shadow
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.1  // Subtle shadow
        textField.layer.shadowOffset = CGSize(width: 0, height: 3)  // Light bottom shadow
        textField.layer.shadowRadius = 8     // Blurred shadow for soft edges
        textField.leftViewPadding = 22
        return textField
    }()

    private let passwordTextField: DesignableUITextField = {
        let textField = DesignableUITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "비밀번호 입력"
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        textField.layer.masksToBounds = false
        textField.rightImage = UIImage(named: "eyeopen")
        
        // Shadow properties for a soft, subtle shadow
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.1  // Subtle shadow
        textField.layer.shadowOffset = CGSize(width: 0, height: 3)  // Light bottom shadow
        textField.layer.shadowRadius = 8     // Blurred shadow for soft edges
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .color1d232c
        button.titleLabel?.font = .ptMedium16Font
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let experienceAdminLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold14Font
        label.textColor = UIColor.color6191ce
        label.text = "관리자 체험하기"
        label.textAlignment = .right
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpViews()
        applyConstraints()
    }

    
    private func setUpNavigationBar(){
        self.title = "광고주 로그인"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        view.addSubview(tagLineLabel)
        view.addSubview(loginLabel)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        view.addSubview(loginButton)
        view.addSubview(experienceAdminLabel)
    }
    
    private func applyConstraints(){
        tagLineLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        experienceAdminLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tagLineLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 62),
            tagLineLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            tagLineLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33),
            tagLineLabel.heightAnchor.constraint(equalToConstant: 19),
            
            
            loginLabel.topAnchor.constraint(equalTo: tagLineLabel.bottomAnchor, constant: 3),
            loginLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            loginLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33),
            loginLabel.heightAnchor.constraint(equalToConstant: 36),
            
            idTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 38.9),
            idTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 53),
            
            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 5.1),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 53),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 9),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 61),
            
            experienceAdminLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15.9),
            experienceAdminLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -31),
            experienceAdminLabel.widthAnchor.constraint(equalToConstant: 106),
            experienceAdminLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    @objc private func didTapLogin(){

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            UIView.transition(with: window, duration: 0.2, options: .transitionCrossDissolve, animations: {
                window.rootViewController = MainTabBarViewController()
            })
        }
    }
    
    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
}
