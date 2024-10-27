//
//  SuccessMessageViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/20/24.
//

import UIKit

class SuccessMessageViewController: UIViewController {

    private let tickImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.image = UIImage(named: "complete")
        imageView.backgroundColor = UIColor.colorffc72a
        imageView.layer.cornerRadius = 34.5
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = .ptExtraBold30Font
        let text = """
        꿀잼 탈퇴가
        완료되었습니다.
        """
        label.textAlignment = .center
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor.color242424, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(.foregroundColor, value: UIColor.colorfa4e29, range: NSRange(location: 3, length: 6))
        label.attributedText = attributedString
        label.numberOfLines = 2
        return label
    }()

    private let departureLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium20Font
        label.textColor = UIColor.color8e8e8e
        label.text = "다음에 또 뵙겠습니다."
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.backgroundColor = UIColor.colorfa4e29
        button.isEnabled = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpViews()
        applyConstratins()
    }
    
    private func setUpNavigationBar(){
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "close")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapClose))
    }
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        view.addSubview(tickImageView)
        view.addSubview(messageLabel)
        view.addSubview(departureLabel)
        view.addSubview(checkButton)
    }
    
    private func applyConstratins(){
        tickImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        departureLabel.translatesAutoresizingMaskIntoConstraints = false
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tickImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 77),
            tickImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            tickImageView.widthAnchor.constraint(equalToConstant: 69),
            tickImageView.heightAnchor.constraint(equalToConstant: 69),
            
            messageLabel.topAnchor.constraint(equalTo: tickImageView.bottomAnchor, constant: 23),
            messageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 101),
            messageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -101),
            messageLabel.heightAnchor.constraint(equalToConstant: 72),
            
            departureLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 13.9),
            departureLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            departureLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            departureLabel.heightAnchor.constraint(equalToConstant: 24),
            
            checkButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            checkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            checkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            checkButton.heightAnchor.constraint(equalToConstant: 73)
        ])
    }
    
    @objc private func didTapClose(){
        navigationController?.popViewController(animated: true)
    }

}
