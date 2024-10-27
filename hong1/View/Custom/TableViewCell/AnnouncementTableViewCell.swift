//
//  AnnoucementTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/20/24.
//

import UIKit
import SnapKit

class AnnouncementTableViewCell: UITableViewCell {

    static let identifier = "AnnoucementTableViewCell"
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.font = .ptMedium14Font
        label.textColor = UIColor.color2c2c2c
        label.backgroundColor = .clear
        label.numberOfLines = .zero
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
        contentView.backgroundColor = UIColor.colorf6f6f6
        contentView.addSubview(messageLabel)
    }
    
    private func applyConstraints() {
        messageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30.7)
            make.leading.equalToSuperview().offset(39)
            make.trailing.equalToSuperview().offset(-39)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

    
    func configure(message: String){
        messageLabel.text = message
    }
    
}
