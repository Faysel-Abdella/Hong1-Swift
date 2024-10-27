//
//  ReasonTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit

class ReasonTableViewCell: UITableViewCell {

    static let identifier = "ReasonTableViewCell"
    
    private let reasonLabel: UILabel = {
       let label = UILabel()
        label.font = .ptRegular16Font
        label.textColor = UIColor.color969696
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(reasonLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        reasonLabel.frame = CGRect(x: 26.3, y: 15, width: 200, height: 20)
    }
    
    func configure(reason: String){
        reasonLabel.text = reason
    }
    

}
