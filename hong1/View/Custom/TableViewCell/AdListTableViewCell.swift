//
//  AdListTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/23/24.
//

import UIKit

class AdListTableViewCell: UITableViewCell {
    
    static let identifier = "AdListTableViewCell"
    
    private let adNameLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold18Font
        label.textColor = .color242424
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("사용중", for: .normal)
        button.setTitleColor(.color368fff, for: .normal)
        button.titleLabel?.font = .ptSemiBold13Font
        button.backgroundColor = .colorf0f5fd
        button.layer.cornerRadius = 16
        return button
    }()
    
    private let registrationDateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium14Font
        label.textColor = .color8e8e8e
        label.text = "등록날짜"
        return label
    }()
    
    private let registrationDateValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium14Font
        label.textColor = .color242424
        return label
    }()
    
    private let accessoryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrow"), for: .normal)
        return button
    }()
    
    private let numberOfAdsLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium14Font
        label.textColor = .color8e8e8e
        label.text = "남은 광고 개수"
        return label
    }()
    
    private let numberOfAdsValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium14Font
        label.textColor = .color242424
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstratins()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
        contentView.addSubview(adNameLabel)
        contentView.addSubview(actionButton)
        contentView.addSubview(registrationDateLabel)
        contentView.addSubview(registrationDateValueLabel)
        contentView.addSubview(accessoryButton)
        contentView.addSubview(numberOfAdsLabel)
        contentView.addSubview(numberOfAdsValueLabel)
    }
    
    private func applyConstratins(){
        adNameLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        registrationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationDateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        accessoryButton.translatesAutoresizingMaskIntoConstraints = false
        numberOfAdsLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfAdsValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
        
            adNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 29),
            adNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            adNameLabel.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -9.2),
            
            actionButton.topAnchor.constraint(equalTo: topAnchor, constant: 26),
            actionButton.widthAnchor.constraint(equalToConstant: 60),
            actionButton.heightAnchor.constraint(equalToConstant: 25),
            
            registrationDateLabel.topAnchor.constraint(equalTo: adNameLabel.bottomAnchor, constant: 13.1),
            registrationDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            registrationDateLabel.heightAnchor.constraint(equalToConstant: 16),
            
            registrationDateValueLabel.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 11.1),
            registrationDateValueLabel.leadingAnchor.constraint(equalTo: registrationDateLabel.trailingAnchor, constant: 47),
            registrationDateValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            accessoryButton.topAnchor.constraint(equalTo: topAnchor, constant: 59.8),
            accessoryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            accessoryButton.widthAnchor.constraint(equalToConstant: 7),
            accessoryButton.heightAnchor.constraint(equalToConstant: 14),
            
            numberOfAdsLabel.topAnchor.constraint(equalTo: registrationDateLabel.bottomAnchor, constant: 5.2),
            numberOfAdsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            numberOfAdsLabel.heightAnchor.constraint(equalToConstant: 16),
            
            numberOfAdsValueLabel.topAnchor.constraint(equalTo: registrationDateValueLabel.bottomAnchor, constant: 5.2),
            numberOfAdsValueLabel.leadingAnchor.constraint(equalTo: numberOfAdsLabel.trailingAnchor, constant: 18),
            numberOfAdsValueLabel.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    func configure(adName: String, date: String, numberOfAds: String){
        adNameLabel.text = adName
        registrationDateValueLabel.text = date
        numberOfAdsValueLabel.text = numberOfAds
    }
}
