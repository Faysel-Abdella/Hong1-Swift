//
//  BasicStatTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/24/24.
//

import UIKit

class BasicStatTableViewCell: UITableViewCell {

    static let identifier = "BasicStatTableViewCell"
    
    private let adNameLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold21Font
        label.textColor = .color242424
        label.text = "리앤쿡5"
        return label
    }()
    
    private let registrationDateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color9b9b9b
        label.textAlignment = .right
        label.text = "등록일 2024.08.05  14:33"
        return label
    }()
    
    private let scrapLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium14Font
        label.textColor = .color242424
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.text = "스크랩"
        return label
    }()
    
    private let scrapValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color9b9b9b
        label.text = "37"
        return label
    }()
    
    private let remainingNumberOfAdsLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium14Font
        label.textColor = .color242424
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.text = "잔여 광고수"
        return label
    }()
    
    private let remainingNumberOfAdsValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color9b9b9b
        label.text = "4/5000"
        return label
    }()
    
    private let viewTitle: UILabel = {
        let label = UILabel()
        label.font = .ptBold18Font
        label.textColor = .colorfa4e29
        label.text = "오늘 조회수"
        return label
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpViews(){
        contentView.addSubview(adNameLabel)
        contentView.addSubview(registrationDateLabel)
        contentView.addSubview(scrapLabel)
        contentView.addSubview(scrapValueLabel)
        contentView.addSubview(remainingNumberOfAdsLabel)
        contentView.addSubview(remainingNumberOfAdsValueLabel)
        contentView.addSubview(viewTitle)
    }
    
    private func applyConstraints(){
        adNameLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        scrapLabel.translatesAutoresizingMaskIntoConstraints = false
        scrapValueLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingNumberOfAdsLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingNumberOfAdsValueLabel.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            adNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27.7),
            adNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            adNameLabel.trailingAnchor.constraint(equalTo: registrationDateLabel.leadingAnchor, constant: -20),
            adNameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            registrationDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 29.6),
            registrationDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            registrationDateLabel.heightAnchor.constraint(equalToConstant: 16),
            
            scrapLabel.topAnchor.constraint(equalTo: adNameLabel.bottomAnchor, constant: 16),
            scrapLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            scrapLabel.trailingAnchor.constraint(equalTo: scrapValueLabel.leadingAnchor, constant: -7),
            scrapLabel.heightAnchor.constraint(equalToConstant: 16),
            
            scrapValueLabel.topAnchor.constraint(equalTo: adNameLabel.bottomAnchor, constant: 16),
            scrapValueLabel.widthAnchor.constraint(equalToConstant: 120),
            scrapValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            remainingNumberOfAdsLabel.topAnchor.constraint(equalTo: scrapLabel.bottomAnchor, constant: 8),
            remainingNumberOfAdsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            remainingNumberOfAdsLabel.trailingAnchor.constraint(equalTo: remainingNumberOfAdsValueLabel.leadingAnchor, constant: -7),
            remainingNumberOfAdsLabel.heightAnchor.constraint(equalToConstant: 16),
            
            remainingNumberOfAdsValueLabel.topAnchor.constraint(equalTo: scrapValueLabel.bottomAnchor, constant: 8),
            remainingNumberOfAdsValueLabel.widthAnchor.constraint(equalToConstant: 150),
            remainingNumberOfAdsValueLabel.heightAnchor.constraint(equalToConstant: 16),
            
            viewTitle.topAnchor.constraint(equalTo: remainingNumberOfAdsLabel.bottomAnchor, constant: 45),
            viewTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewTitle.heightAnchor.constraint(equalToConstant: 21)
        ])
        
    }
}
