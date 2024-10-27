//
//  SettingTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/18/24.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {

    static let identifier = "SettingTableViewCell"
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let settingLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = UIColor.color2e2e2e
        label.numberOfLines = 1
        return label
    }()
    
    private let accessoryButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrow"), for: .normal)
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
        contentView.addSubview(iconImageView)
        contentView.addSubview(settingLabel)
        contentView.addSubview(accessoryButton)
    }
    
    private func applyConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.leading.equalToSuperview().offset(17)
            make.width.height.equalTo(23)
        }

        settingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(iconImageView.snp.trailing).offset(9)
            make.trailing.equalTo(accessoryButton.snp.leading).offset(-20)
            make.height.equalTo(19)
        }

        accessoryButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23.5)
            make.trailing.equalToSuperview().inset(27.4)
            make.width.equalTo(7)
            make.height.equalTo(14)
        }
    }

    
    func configure(iconName: String, settingName: String){
        iconImageView.image = UIImage(named: iconName)
        settingLabel.text = settingName
    }
}
