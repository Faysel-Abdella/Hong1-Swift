//
//  EventTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/21/24.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    static let identifier = "EventTableViewCell"
    
    private let adImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let eventNameLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold16Font
        label.textColor = UIColor.color2e2e2e
        return label
    }()
    
    private let scheduleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular12Font
        label.textColor = UIColor.color9b9b9b
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
        contentView.addSubview(adImageView)
        contentView.addSubview(eventNameLabel)
        contentView.addSubview(scheduleLabel)
    }
    
    private func applyConstrains(){
        adImageView.translatesAutoresizingMaskIntoConstraints = false
        eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            adImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12.4),
            adImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            adImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            adImageView.heightAnchor.constraint(equalToConstant: 139.9),
            
            eventNameLabel.topAnchor.constraint(equalTo: adImageView.bottomAnchor, constant: 10.8),
            eventNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            eventNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            eventNameLabel.heightAnchor.constraint(equalToConstant: 19),
            
            scheduleLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 5.2),
            scheduleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            scheduleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            scheduleLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    func configure(image: String, eventName: String, fromDate: String, toDate: String){
        adImageView.image = UIImage(named: image)
        eventNameLabel.text = eventName
        scheduleLabel.text = "\(fromDate) ~ \(toDate)"
    }
}
