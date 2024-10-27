//
//  AdConsumptionRateStatTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/24/24.
//

import UIKit

class AdConsumptionRateStatTableViewCell: UITableViewCell {

    static let identifier = "AdConsumptionRateStatTableViewCell"
    
    private let dailyRateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular13Font
        label.textColor = .color8e8e8e
        label.text = "하루 광고 소진률"
        return label
    }()
    
    private let dailyRateValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium20Font
        label.textColor = .color242424
        label.text = "1680"
        return label
    }()
    
    private let byRegionRateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular13Font
        label.textColor = .color8e8e8e
        label.text = "지역별 광고 소진률"
        return label
    }()
    
    private let byRegionRateValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium20Font
        label.textColor = .color242424
        label.text = "4450"
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
        contentView.addSubview(dailyRateLabel)
        contentView.addSubview(dailyRateValueLabel)
        contentView.addSubview(byRegionRateLabel)
        contentView.addSubview(byRegionRateValueLabel)
    }
    
    private func applyConstraints(){
        dailyRateLabel.translatesAutoresizingMaskIntoConstraints = false
        dailyRateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        byRegionRateLabel.translatesAutoresizingMaskIntoConstraints = false
        byRegionRateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            dailyRateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            dailyRateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            dailyRateLabel.trailingAnchor.constraint(equalTo: byRegionRateLabel.leadingAnchor, constant: -10),
            dailyRateLabel.heightAnchor.constraint(equalToConstant: 15),
            
            dailyRateValueLabel.topAnchor.constraint(equalTo: dailyRateLabel.bottomAnchor, constant: 5),
            dailyRateValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            dailyRateValueLabel.trailingAnchor.constraint(equalTo: byRegionRateValueLabel.leadingAnchor, constant: -10),
            dailyRateValueLabel.heightAnchor.constraint(equalToConstant: 28),
            
            byRegionRateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            byRegionRateLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            byRegionRateLabel.heightAnchor.constraint(equalToConstant: 15),
            
            byRegionRateValueLabel.topAnchor.constraint(equalTo: byRegionRateLabel.bottomAnchor, constant: 5),
            byRegionRateValueLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            byRegionRateValueLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
}
