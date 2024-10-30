//
//  WarningCollectionViewCell.swift
//  hong1
//
//  Created by NAHØM on 27/10/2024.
//

import UIKit

class WarningCollectionViewCell: UICollectionViewCell {
    
    var title: String = ""
    var image: String = "" {
        didSet {
            setupCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupCell() {
        let view = createBox(title: title, image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(view)
        contentView.backgroundColor = .colorfafafa
        
        // Set constraints for view inside contentView
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    
    private func createBox(title: String, image: String) -> UIView {
        let boxView = UIView()
        boxView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        boxView.layer.cornerRadius = 12
        boxView.clipsToBounds = true
        
        // Title label
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 2
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Image view
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        // Add subviews to boxView
        boxView.addSubview(titleLabel)
        boxView.addSubview(imageView)
        
        // Constraints for titleLabel (top-left)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: boxView.topAnchor, constant: 10)
        ])
        
        // Constraints for imageView (bottom-right)
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: boxView.bottomAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 30), // Set desired width
            imageView.heightAnchor.constraint(equalToConstant: 30) // Set desired height
        ])
        
        return boxView
    }

}
