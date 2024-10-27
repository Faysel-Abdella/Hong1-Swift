//
//  TipsTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/17/24.
//

import UIKit

class TipsTableViewCell: UITableViewCell {
    
    static let identifier = "TipsTableViewCell"
    
    let tipLabels: [UILabel] = {
        let labels = [UILabel(), UILabel(), UILabel()]
        return labels
    }()
    
    let tipStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 4.9
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLabels()
        setUpStack()
        applyConstratins()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLabels(){
        for label in tipLabels {
            label.font = .ptRegular12Font
            label.textColor = UIColor.color9b9b9b
            label.numberOfLines = 1
        }
    }
    
    private func setUpStack(){
        let tips = [
            "하루 최대 20개까지 보관 가능합니다",
            "3일동안 보관되며, 3일이 지난 광고는 다른 사용자에게 이동합니다.",
            "광고가 만료되거나 소멸되면 저장된 광고가 사라질 수 있습니다."
        ]
        var tipIndex = 0
        
        for label in tipLabels {
            label.text = tips[tipIndex]
            tipStack.addArrangedSubview(label)
            tipIndex += 1
        }
        
        contentView.addSubview(tipStack)
    }
    
    private func applyConstratins(){
        tipStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tipStack.topAnchor.constraint(equalTo: topAnchor, constant: 18.6),
            tipStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 33.3),
            tipStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -33.3),
            tipStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18.6)
        ])
    }
}
