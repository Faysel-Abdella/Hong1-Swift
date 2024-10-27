//
//  AdStatView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/23/24.
//

import UIKit

class AdStatView: UIView {

    private let topicLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium13Font
        label.textColor = .color242424
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold40Font
        label.textColor = .color242424
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpViews(){
        addSubview(topicLabel)
        addSubview(numberLabel)
    }
    
    
    private func applyConstraints(){
        topicLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topicLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32.1),
            topicLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            topicLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
            topicLabel.heightAnchor.constraint(equalToConstant: 15),
            
            numberLabel.topAnchor.constraint(equalTo: topicLabel.bottomAnchor, constant: 5.2),
            numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 19),
            numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
            numberLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func configure(topic: String, number: String){
        topicLabel.text = topic
        numberLabel.text = number
    }
    
    
}
