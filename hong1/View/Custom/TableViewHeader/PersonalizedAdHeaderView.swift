//
//  PersonalizedAdHeaderView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/25/24.
//

import UIKit

class PersonalizedAdHeaderView: UITableViewHeaderFooterView {

    static let identifier = "PersonalizedAdHeaderView"
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptExtraBold28Font
        label.textColor = .color242424
        label.text = "맞춤 광고"
        return label
    }()
    
    private let headerSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color8e8e8e
        label.text = "나에게 맞는 정보와 혜택을 확인해보세요."
        return label
    }()
    
    private let entireButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체", for: .normal)
        button.setTitleColor(.colorff4a00, for: .normal)
        button.titleLabel?.font = .ptSemiBold16Font
        button.backgroundColor = .colorfdeada
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colorfa4e29.cgColor
        button.layer.cornerRadius = 23
        return button
    }()
    
    private let storeButton: UIButton = {
        let button = UIButton()
        button.setTitle("가게", for: .normal)
        button.titleLabel?.font = .ptSemiBold16Font
        button.setTitleColor(.color2d2d2d, for: .normal)
        button.backgroundColor = .colorfdeada
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colord4d4d4.cgColor
        button.layer.cornerRadius = 23
        return button
    }()
    
    private let productButton: UIButton = {
        let button = UIButton()
        button.setTitle("제품", for: .normal)
        button.titleLabel?.font = .ptSemiBold16Font
        button.setTitleColor(.color2d2d2d, for: .normal)
        button.backgroundColor = .colorfdeada
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colord4d4d4.cgColor
        button.layer.cornerRadius = 23
        return button
    }()
    
    private let businessButton: UIButton = {
        let button = UIButton()
        button.setTitle("영업", for: .normal)
        button.titleLabel?.font = .ptSemiBold16Font
        button.setTitleColor(.color2d2d2d, for: .normal)
        button.backgroundColor = .colorfdeada
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colord4d4d4.cgColor
        button.layer.cornerRadius = 23
        return button
    }()
    
    private let extraButton: UIButton = {
        let button = UIButton()
        button.setTitle("기타", for: .normal)
        button.titleLabel?.font = .ptSemiBold16Font
        button.setTitleColor(.color2d2d2d, for: .normal)
        button.backgroundColor = .colorfdeada
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colord4d4d4.cgColor
        button.layer.cornerRadius = 23
        return button
    }()
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 6.4
        return stack
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
        contentView.addSubview(headerTitleLabel)
        contentView.addSubview(headerSubtitleLabel)

        
        buttonStack.addArrangedSubview(entireButton)
        buttonStack.addArrangedSubview(storeButton)
        buttonStack.addArrangedSubview(productButton)
        buttonStack.addArrangedSubview(businessButton)
        buttonStack.addArrangedSubview(extraButton)
        
        contentView.addSubview(buttonStack)
    }
    
    
    private func applyConstraints(){
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 49.2),
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            headerTitleLabel.widthAnchor.constraint(equalToConstant: 120),
            headerTitleLabel.heightAnchor.constraint(equalToConstant: 34),
            
            headerSubtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 61.4),
            headerSubtitleLabel.leadingAnchor.constraint(equalTo: headerTitleLabel.trailingAnchor, constant: 11.5),
            headerSubtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            headerSubtitleLabel.heightAnchor.constraint(equalToConstant: 16),
            
            buttonStack.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 21),
            buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            buttonStack.heightAnchor.constraint(equalToConstant: 37.4)
        ])
    }
}
