//
//  RangeSettingTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/18/24.
//

import UIKit
import SnapKit

class SliderSettingTableViewCell: UITableViewCell {

    static let identifier = "SliderSettingTableViewCell"
    var onSliderValueChanged: ((Float) -> Void)?
    
    private let settingLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = UIColor.color2e2e2e
        label.numberOfLines = 1
        return label
    }()
    
    
    private let lowerValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = UIColor.color2e2e2e
        label.text = "가-"
        label.numberOfLines = 1
        return label
    }()
    
    private let slider: ThickTrackSlider = {
        let slider = ThickTrackSlider()
        slider.minimumValue = 0
        slider.maximumValue = 25
        slider.value = 12
        slider.tintColor = UIColor.colorfca31e
        return slider
    }()
    
    private let upperValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = UIColor.color2e2e2e
        label.numberOfLines = 1
        label.text = "가+"
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
        contentView.addSubview(settingLabel)
        contentView.addSubview(lowerValueLabel)
        contentView.addSubview(slider)
        contentView.addSubview(upperValueLabel)
    }
    
    
    private func applyConstraints() {
        settingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(19)
        }
        
        lowerValueLabel.snp.makeConstraints { make in
            make.top.equalTo(settingLabel.snp.bottom).offset(16.3)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalTo(slider.snp.leading).offset(-8)
            make.width.equalTo(30)
            make.height.equalTo(19)
        }
        
        slider.snp.makeConstraints { make in
            make.top.equalTo(settingLabel.snp.bottom).offset(16.3)
            make.height.equalTo(15)
        }
        
        upperValueLabel.snp.makeConstraints { make in
            make.top.equalTo(settingLabel.snp.bottom).offset(16.3)
            make.trailing.equalToSuperview().offset(-24)
            make.leading.equalTo(slider.snp.trailing).offset(8)
            make.width.equalTo(30)
            make.height.equalTo(19)
        }
    }

    func configure(settingName: String, sliderValue: Float){
        settingLabel.text = settingName
        slider.value = sliderValue
    }
}
