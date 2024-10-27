//
//  DemographyStatTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/24/24.
//

import UIKit

class DemographyStatTableViewCell: UITableViewCell {

    static let identifier = "DemographyStatTableViewCell"
    
    private let genderAdViewershipLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular13Font
        label.textColor = .color8e8e8e
        label.text = "성별 광고 시청률"
        return label
    }()
    
    private let genderAdViewershipValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium20Font
        label.textColor = .color242424
        label.text = "32.5 % 67.5 %"
        return label
    }()
    
    private let ageAdViewershipLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular13Font
        label.textColor = .color8e8e8e
        label.text = "연령대별 광고 시청률"
        return label
    }()
    
    private let ageAdViewershipValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium20Font
        label.textColor = .color242424
        label.text = "50대 51.1%"
        return label
    }()
    
    private let levelLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color9b9b9b
        label.text = "최고"
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
        contentView.addSubview(genderAdViewershipLabel)
        contentView.addSubview(genderAdViewershipValueLabel)
        contentView.addSubview(ageAdViewershipLabel)
        contentView.addSubview(levelLabel)
        contentView.addSubview(ageAdViewershipValueLabel)
    }
    
    private func applyConstraints(){
        genderAdViewershipLabel.translatesAutoresizingMaskIntoConstraints = false
        genderAdViewershipValueLabel.translatesAutoresizingMaskIntoConstraints = false
        ageAdViewershipLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        ageAdViewershipValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genderAdViewershipLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            genderAdViewershipLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            genderAdViewershipLabel.trailingAnchor.constraint(equalTo: ageAdViewershipLabel.leadingAnchor, constant: -10),
            genderAdViewershipLabel.heightAnchor.constraint(equalToConstant: 15),
            
            genderAdViewershipValueLabel.topAnchor.constraint(equalTo: genderAdViewershipLabel.bottomAnchor, constant: 5),
            genderAdViewershipValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            genderAdViewershipValueLabel.trailingAnchor.constraint(equalTo: ageAdViewershipLabel.leadingAnchor, constant: -10),
            genderAdViewershipValueLabel.heightAnchor.constraint(equalToConstant: 28),
            
            ageAdViewershipLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            ageAdViewershipLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            ageAdViewershipLabel.heightAnchor.constraint(equalToConstant: 15),
            
            levelLabel.topAnchor.constraint(equalTo: ageAdViewershipLabel.bottomAnchor, constant: 16),
            levelLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            levelLabel.widthAnchor.constraint(equalToConstant: 26),
            levelLabel.heightAnchor.constraint(equalToConstant: 16),
            
            ageAdViewershipValueLabel.topAnchor.constraint(equalTo: ageAdViewershipLabel.bottomAnchor, constant: 5),
            ageAdViewershipValueLabel.leadingAnchor.constraint(equalTo: levelLabel.trailingAnchor, constant: 10),
            ageAdViewershipValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            ageAdViewershipValueLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
}
