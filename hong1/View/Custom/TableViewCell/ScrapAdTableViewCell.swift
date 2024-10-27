//
//  ScrapAdTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/18/24.
//

import UIKit

class ScrapAdTableViewCell: BaseAdTableViewCell {
    
    let scrapDateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular12Font
        label.textColor = UIColor.color9b9b9b
        label.numberOfLines = 1
        return label
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
        contentView.addSubview(scrapDateLabel)
    }
    
    private func applySpecificConstraints() {
        scrapDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrapDateLabel.topAnchor.constraint(equalTo: adTitleLabel.bottomAnchor, constant: 5),
            scrapDateLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            scrapDateLabel.trailingAnchor.constraint(equalTo: viewAdButton.leadingAnchor, constant: -12),
            scrapDateLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    func configure(adTitle: String, scrapDate: String){
        iconImageView.image = UIImage(named: "scrap")
        adTitleLabel.text = adTitle
        scrapDateLabel.text = scrapDate
    }
}
