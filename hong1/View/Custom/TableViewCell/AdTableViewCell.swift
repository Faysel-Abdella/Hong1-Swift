//
//  AdTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit
import SnapKit

class AdTableViewCell: UITableViewCell {

    static let identifier = "AdTableViewCell"
    
    private let adImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        return imageView
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
        contentView.addSubview(adImage)
    }
    
    private func applyConstraints() {
        adImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28.5)
            make.leading.equalToSuperview().offset(21)
            make.trailing.equalToSuperview().offset(-21)
            make.bottom.equalToSuperview().offset(-28.5)
        }
    }

    
    func configure(image: String){
        adImage.image = UIImage(named: image) //This can change when network call gets implemented
    }
}
