//
//  AbeeStoreListCell.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit
import SnapKit

/// 재사용되는 리스트 셀(상점, 시장 상점, 서비스 상점 등)
final class AbeeStoreListCell: BaseCollectionViewCell {
    // MARK: - UI
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular12Font
        label.textColor = .color2d2d2d
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold16Font
        label.textColor = .color2d2d2d
        return label
    }()
    
    private let pinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location2_pin")?.resize(to: CGSize(width: 11, height: 13))
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular13Font
        label.textColor = .color959595
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .colord5d5d5
        return view
    }()
    
    // MARK: - Properties
    
    // MARK: - Layouts
    override func configureLayouts() {
        contentView.addSubview(titleImageView)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(pinImageView)
        contentView.addSubview(addressLabel)
        contentView.addSubview(dividerView)
        
        titleImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.height.equalTo(84)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.left.equalTo(titleImageView.snp.right).offset(19)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(14)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(2)
            make.left.equalTo(titleImageView.snp.right).offset(19)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(19)
        }
        
        pinImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.left.equalTo(titleImageView.snp.right).offset(19)
            make.width.equalTo(12)
            make.height.equalTo(14)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.centerY.equalTo(pinImageView)
            make.left.equalTo(pinImageView.snp.right).offset(5)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(15)
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(titleImageView.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}

extension AbeeStoreListCell {
    func configure(title: String, subTitle: String, address: String) {
        subTitleLabel.configureTextWithLineHeight(text: subTitle, lineHeight: 20)
        titleLabel.configureTextWithLineHeight(text: title, lineHeight: 19)
        addressLabel.configureTextWithLineHeight(text: address, lineHeight: 15)
    }
}
