//
//  SeeMoreTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/26/24.
//

import UIKit

class SeeMoreTableViewCell: UITableViewCell {

    static let identifier = "SeeMoreTableViewCell"
    
    private let seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기", for: .normal)
        button.titleLabel?.font = .ptSemiBold15Font
        button.setTitleColor(.color878d93, for: .normal)
        button.backgroundColor = .coloreff3f5
        button.layer.cornerRadius = 8
        return button
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
        contentView.addSubview(seeMoreButton)
    }
    
    
    private func applyConstraints(){
        seeMoreButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            seeMoreButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            seeMoreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            seeMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            seeMoreButton.heightAnchor.constraint(equalToConstant: 52.3)
        ])
    }
    

}
