//
//  PersonalizedAdTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/25/24.
//

import UIKit

class PersonalizedAdTableViewCell: UITableViewCell {
    
    static let identifier = "PersonalizedAdTableViewCell"
    
    private let adImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let adTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold15Font
        label.textColor = .color242424
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular12Font
        label.textColor = .color9b9b9b
        return label
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        return button
    }()
    
    private let numberOfLikesLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color242424
        return label
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comment"), for: .normal)
        return button
    }()
    
    private let numberOfCommentsLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color242424
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
        contentView.addSubview(adImageView)
        contentView.addSubview(adTitleLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(likeButton)
        contentView.addSubview(numberOfLikesLabel)
        contentView.addSubview(commentButton)
        contentView.addSubview(numberOfCommentsLabel)
    }
    
    private func applyConstraints(){
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        adTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        numberOfLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        numberOfCommentsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            adImageView.topAnchor.constraint(equalTo: topAnchor, constant: 7.2),
            adImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            adImageView.widthAnchor.constraint(equalToConstant: 84),
            adImageView.heightAnchor.constraint(equalToConstant: 84),
            
            adTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18.1),
            adTitleLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: 19.2),
            adTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            adTitleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            addressLabel.topAnchor.constraint(equalTo: adTitleLabel.bottomAnchor, constant: 8),
            addressLabel.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: 21.2),
            addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            addressLabel.heightAnchor.constraint(equalToConstant: 14),
            
            likeButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 8.6),
            likeButton.leadingAnchor.constraint(equalTo: adImageView.trailingAnchor, constant: 21.2),
            likeButton.widthAnchor.constraint(equalToConstant: 16),
            likeButton.heightAnchor.constraint(equalToConstant: 16),
            
            numberOfLikesLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 8),
            numberOfLikesLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 3.1),
            numberOfLikesLabel.widthAnchor.constraint(equalToConstant: 40),
            numberOfLikesLabel.heightAnchor.constraint(equalToConstant: 16),
            
            commentButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 8.6),
            commentButton.leadingAnchor.constraint(equalTo: numberOfLikesLabel.trailingAnchor, constant: 14.9),
            commentButton.widthAnchor.constraint(equalToConstant: 16),
            commentButton.heightAnchor.constraint(equalToConstant: 16),
            
            numberOfCommentsLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 8),
            numberOfCommentsLabel.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 1.5),
            numberOfCommentsLabel.widthAnchor.constraint(equalToConstant: 60),
            numberOfCommentsLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    
    func configure(ad: Ad){
        adImageView.image = UIImage(named: ad.imageName)
        adTitleLabel.text = ad.adTitle
        addressLabel.text = ad.address
        numberOfLikesLabel.text = ad.likesCount
        numberOfCommentsLabel.text = ad.commentsCount
    }
    
}
