//
//  CreateAdListTableViewCell.swift
//  hong1
//
//  Created by NAHØM on 26/10/2024.
//

import UIKit

class CreateAdListTableViewCell: UITableViewCell {
    
     var iconImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "bird") // replace with your custom bee icon if you have it
            imageView.tintColor = .black
            imageView.contentMode = .scaleAspectFit
            imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
            return imageView
        }()
        
        // Title Label
    var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "일벌 (무료)"
            label.font = UIFont.boldSystemFont(ofSize: 16)
            return label
        }()
        
        // Description Label
    var subtitleLabel: UILabel = {
            let label = UILabel()
            label.text = "한달에 한번 무료로 광고를!\n내가 원하는 타켓에게 벌을 날려요"
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
            label.numberOfLines = 2
            return label
        }()
        
        // Arrow ImageView
        private let arrowImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "chevron.right") // replace with your custom arrow icon if you have it
            imageView.tintColor = .gray
            imageView.contentMode = .center
            imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            imageView.layer.cornerRadius = 15
            imageView.backgroundColor = .colorf2f2f2
            return imageView
        }()
        
        // StackView for title and description
        private lazy var textStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
            stackView.axis = .vertical
            stackView.spacing = 4
            return stackView
        }()
        
        // Horizontal StackView for main layout
        private lazy var horizontalStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [iconImageView, textStackView, arrowImageView])
            stackView.axis = .horizontal
            stackView.spacing = 30
            stackView.alignment = .center
            return stackView
        }()
        
        // Initializer
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            // Add the stack view to the content view
            contentView.addSubview(horizontalStackView)
            
            // Enable Auto Layout
            horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
            
            // Set constraints for the stack view
            NSLayoutConstraint.activate([
                horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
                horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7)
            ])
            
//            horizontalStackView.backgroundColor = UIColor(white: 0.95, alpha: 1) // light gray background
            horizontalStackView.layer.cornerRadius = 12
        
//            horizontalStackView.layer.shadowOpacity = 0.5
            horizontalStackView.layer.masksToBounds = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
