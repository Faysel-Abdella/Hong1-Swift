//
//  NotificationSettingTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/18/24.
//

import UIKit
import SnapKit

class NotificationSettingTableViewCell: UITableViewCell {

    static let identifier = "NotificationSettingTableViewCell"
    var switchValueChanged: ((Bool) -> Void)?
    
    private let settingLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = UIColor.color2e2e2e
        label.numberOfLines = 1
        return label
    }()

    private let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = UIColor.colorfcb300
        return switchButton
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
        contentView.addSubview(settingLabel)
        contentView.addSubview(switchButton)
    }
    
    private func applyConstraints() {
        settingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23.7)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(switchButton.snp.leading).offset(-20)
            make.height.equalTo(19)
        }
        
        switchButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-22)
            make.height.equalTo(36)
        }
    }

    
    func configure(settingName: String, isSwitchedOn: Bool){
        settingLabel.text = settingName
        switchButton.isOn = isSwitchedOn
    }
    
    @objc private func switchToggled() {
            switchValueChanged?(switchButton.isOn) // Call the closure when switch is toggled
    }
}
