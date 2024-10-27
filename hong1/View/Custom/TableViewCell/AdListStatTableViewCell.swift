//
//  AdListHeaderView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/23/24.
//

import UIKit

class AdListStatTableViewCell: UITableViewCell {
    
    static let identifier = "AdListStatTableViewCell"
    
    private let fullAdsStatView = AdStatView()
    private let leftSeparatorView = UIView()
    private let currentAdsStatView = AdStatView()
    private let rightSeparatorView = UIView()
    private let endedAdsStatView = AdStatView()
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
        fullAdsStatView.configure(topic: "종료된 광고", number: "1185")
        leftSeparatorView.backgroundColor = .colord5d5d5
        currentAdsStatView.configure(topic: "진행중인 광고", number: "212")
        rightSeparatorView.backgroundColor = .colord5d5d5
        endedAdsStatView.configure(topic: "종료된 광고", number: "973")
      
        contentView.addSubview(fullAdsStatView)
        contentView.addSubview(leftSeparatorView)
        contentView.addSubview(currentAdsStatView)
        contentView.addSubview(rightSeparatorView)
        contentView.addSubview(endedAdsStatView)
    }
    
    
    private func applyConstraints(){
        fullAdsStatView.translatesAutoresizingMaskIntoConstraints = false
        leftSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        currentAdsStatView.translatesAutoresizingMaskIntoConstraints = false
        rightSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        endedAdsStatView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            fullAdsStatView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            fullAdsStatView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            fullAdsStatView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3),
            fullAdsStatView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1),
            
            leftSeparatorView.topAnchor.constraint(equalTo: topAnchor, constant: 21.4),
            leftSeparatorView.leadingAnchor.constraint(equalTo: fullAdsStatView.trailingAnchor, constant: 0),
            leftSeparatorView.widthAnchor.constraint(equalToConstant: 1),
            leftSeparatorView.heightAnchor.constraint(equalToConstant: 84.6),
            
            currentAdsStatView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            currentAdsStatView.leadingAnchor.constraint(equalTo: leftSeparatorView.trailingAnchor, constant: 0),
            currentAdsStatView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3),
            currentAdsStatView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1),
            
            rightSeparatorView.topAnchor.constraint(equalTo: topAnchor, constant: 21.4),
            rightSeparatorView.leadingAnchor.constraint(equalTo: currentAdsStatView.trailingAnchor, constant: 0),
            rightSeparatorView.widthAnchor.constraint(equalToConstant: 1),
            rightSeparatorView.heightAnchor.constraint(equalToConstant: 84.6),
            
            endedAdsStatView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            endedAdsStatView.leadingAnchor.constraint(equalTo: rightSeparatorView.trailingAnchor, constant: 0),
            endedAdsStatView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1 / 3),
            endedAdsStatView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1)
        ])
    }
    
    
    
}
