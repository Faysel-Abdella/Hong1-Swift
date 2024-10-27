//
//  RegionTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit
import SnapKit

class RegionTableViewCell: UITableViewCell {

    static let identifier = "RegionTableViewCell"
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold14Font
        label.textColor = UIColor.color8e8e8e
        label.textAlignment = .justified
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let districtLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold14Font
        label.textColor = UIColor.color2e2e2e
        label.textAlignment = .justified
        label.numberOfLines = 1
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
    
    func setUpViews(){
        contentView.addSubview(cityLabel)
        contentView.addSubview(districtLabel)
    }
    
    private func applyConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(86)
            make.height.equalTo(53)
        }
        
        districtLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(cityLabel.snp.trailing).offset(35)
            make.width.equalTo(100)
            make.height.equalTo(53)
        }
    }

    func configure(city: String, district: String, isSelected: Bool){
        cityLabel.text = city
        districtLabel.text = district
        if isSelected {
            cityLabel.backgroundColor = UIColor.colorf5f5f5
        }else{
            cityLabel.backgroundColor = .white
        }
    }
}
