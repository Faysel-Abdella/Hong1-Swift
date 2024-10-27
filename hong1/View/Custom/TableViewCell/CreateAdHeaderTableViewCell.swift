//
//  CreateAdHeaderTableViewCell.swift
//  hong1
//
//  Created by NAHØM on 26/10/2024.
//

import UIKit

class CreateAdHeaderTableViewCell: UITableViewCell {
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    private func setupCell() {
        contentView.addSubview(mainStackView)
        
        // Create and add each box
        mainStackView.addArrangedSubview(createBox(title: "진행", count: "6"))
        mainStackView.addArrangedSubview(createBox(title: "대기", count: "5"))
        mainStackView.addArrangedSubview(createBox(title: "종료", count: "19"))
        
        // Constraints for mainStackView
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func createBox(title: String, count: String) -> UIView {
        let boxView = UIView()
        boxView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        boxView.layer.cornerRadius = 12
        boxView.clipsToBounds = true
        
        // Title label
        let titleLabel = UILabel()
        titleLabel.text = "\(title) >"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .gray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Count label
        let countLabel = UILabel()
        countLabel.text = count
        countLabel.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        countLabel.textColor = .black
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Stack view for labels inside the box
        let stackView = UIStackView(arrangedSubviews: [titleLabel, countLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        boxView.addSubview(stackView)
        
        // Constraints for stackView inside the boxView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor)
        ])
        
        return boxView
    }
}
