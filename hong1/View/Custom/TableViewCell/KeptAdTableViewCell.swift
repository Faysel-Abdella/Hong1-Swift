//
//  KeptAdTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/17/24.
//

import UIKit
class KeptAdTableViewCell: BaseAdTableViewCell {
    
    let expiryDateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular12Font
        label.textColor = UIColor.color9b9b9b
        label.numberOfLines = 1
        return label
    }()
    
    let archiveDateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular12Font
        label.textColor = UIColor.color9b9b9b
        label.numberOfLines = 1
        return label
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.color707070
        return view
    }()
    
    private let dateStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 14
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCommonViews()
        setUpSpecificViews()
        applyCommonConstraints() 
        applySpecificConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpSpecificViews() {
        dateStack.addArrangedSubview(expiryDateLabel)
        dateStack.addArrangedSubview(divider)
        dateStack.addArrangedSubview(archiveDateLabel)
        contentView.addSubview(dateStack)
    }
    
    private func applySpecificConstraints() {
        divider.translatesAutoresizingMaskIntoConstraints = false
        dateStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            
            divider.widthAnchor.constraint(equalToConstant: 1),
            divider.heightAnchor.constraint(equalTo: dateStack.heightAnchor, multiplier: 1.0), 
            
            
            dateStack.topAnchor.constraint(equalTo: adTitleLabel.bottomAnchor, constant: 5),
            dateStack.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            dateStack.trailingAnchor.constraint(equalTo: viewAdButton.leadingAnchor, constant: -12),
            dateStack.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    func configure(adTitle: String, expiryDate: String, archiveDate: String){
        iconImageView.image = UIImage(named: "keep")
        adTitleLabel.text = adTitle
        expiryDateLabel.text = expiryDate
        archiveDateLabel.text = archiveDate
    }
}

