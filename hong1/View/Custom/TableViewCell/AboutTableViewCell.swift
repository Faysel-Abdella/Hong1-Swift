//
//  AboutTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    static let identifier = "AboutTableViewCell"
    
    let informationLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium13Font
        label.textColor = UIColor.color9b9b9b
        label.numberOfLines = 1
        return label
    }()
    
    let moreLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular12Font
        label.textColor = UIColor.color9b9b9b
        label.numberOfLines = 1
        label.isHidden = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstratins()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setUpViews(){
        contentView.addSubview(informationLabel)
        contentView.addSubview(moreLabel)
    }
    
    private func applyConstratins(){
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        moreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            informationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            informationLabel.trailingAnchor.constraint(equalTo: moreLabel.leadingAnchor, constant: -20),
            informationLabel.heightAnchor.constraint(equalToConstant: 15),
            
            
            moreLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            moreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            moreLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    func configure(info: String, more: String?){
        informationLabel.text = info
        if let more {
            moreLabel.text = more
            moreLabel.isHidden = false
        }
    }
}
