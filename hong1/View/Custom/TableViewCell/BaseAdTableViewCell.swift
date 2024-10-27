//
//  BaseAdTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/18/24.
//

import UIKit

class BaseAdTableViewCell: UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 19
        return imageView
    }()
    
    let adTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium14Font
        label.textColor = UIColor.color242424
        label.numberOfLines = 1
        return label
    }()
    
    let viewAdButton: UIButton = {
        let button = UIButton()
        button.setTitle("광고보기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.colorfa4e29
        button.layer.cornerRadius = 6
        return button
    }()
    
    
    func setUpCommonViews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(adTitleLabel)
        contentView.addSubview(viewAdButton)
    }
    
    func applyCommonConstraints() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        adTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        viewAdButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // MARK: - Common constraints for iconImageView, adTitleLabel, viewAdButton
            
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23),
            iconImageView.widthAnchor.constraint(equalToConstant: 38),
            iconImageView.heightAnchor.constraint(equalToConstant: 38),
            
            adTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6.9),
            adTitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            adTitleLabel.trailingAnchor.constraint(equalTo: viewAdButton.leadingAnchor, constant: -12),
            adTitleLabel.heightAnchor.constraint(equalToConstant: 16),
            
            viewAdButton.topAnchor.constraint(equalTo: topAnchor, constant: 10.4),
            viewAdButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            viewAdButton.widthAnchor.constraint(equalToConstant: 72),
            viewAdButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

