//
//  StatHeaderView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/24/24.
//

import UIKit

class StatHeaderView: UITableViewHeaderFooterView {

    static let identifier = "StatHeaderView"

    private let previousDayButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowl"), for: .normal)
        return button
    }()
    
    private let selectedDateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium18Font
        label.textColor = .color242424
        label.text = "2024.08.05"
        label.textAlignment = .center
        return label
    }()
    
    private let nextDayButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowr"), for: .normal)
        return button
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
        contentView.addSubview(previousDayButton)
        contentView.addSubview(selectedDateLabel)
        contentView.addSubview(nextDayButton)
    }
    
    private func applyConstraints(){
        previousDayButton.translatesAutoresizingMaskIntoConstraints = false
        selectedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        nextDayButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            previousDayButton.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            previousDayButton.trailingAnchor.constraint(equalTo: selectedDateLabel.leadingAnchor, constant: -37),
            previousDayButton.widthAnchor.constraint(equalToConstant: 7),
            previousDayButton.heightAnchor.constraint(equalToConstant: 14),
            
            selectedDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            selectedDateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            selectedDateLabel.widthAnchor.constraint(equalToConstant: 120),
            selectedDateLabel.heightAnchor.constraint(equalToConstant: 21),
            
            nextDayButton.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            nextDayButton.leadingAnchor.constraint(equalTo: selectedDateLabel.trailingAnchor, constant: 37),
            nextDayButton.widthAnchor.constraint(equalToConstant: 7),
            nextDayButton.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
}
