//
//  OneToOneTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/22/24.
//

import UIKit
import SnapKit

class OneToOneTableViewCell: UITableViewCell {

    static let identifier = "OneToOneTableViewCell"
    
    private let reportLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold15Font
        label.textColor = UIColor.color242424
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold14Font
        label.textColor = UIColor.colorfa4e29
        return label
    }()
    
    private let separatorLineView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.colord5d5d5
        return line
    }()
    
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium14Font
        label.textColor = UIColor.color2e2e2e
        label.numberOfLines = .zero
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular13Font
        label.textColor = UIColor.color9b9b9b
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
        contentView.addSubview(reportLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(separatorLineView)
        contentView.addSubview(answerLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func applyConstraints(){
        reportLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25.7)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(18)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(reportLabel.snp.bottom).offset(30.4)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(16)
        }
        
        separatorLineView.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(13.2)
            make.leading.equalToSuperview().offset(20.5)
            make.trailing.equalToSuperview().inset(20.5)
            make.height.equalTo(1)
        }
        
        answerLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorLineView.snp.bottom).offset(16.5)
            make.leading.equalToSuperview().offset(21)
            make.trailing.equalToSuperview().inset(21)
            make.height.equalTo(174)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(answerLabel.snp.bottom).offset(21.2)
            make.leading.equalToSuperview().offset(21)
            make.trailing.equalToSuperview().inset(21)
            make.height.equalTo(15)
        }
    }
    
    func configure(oneToOne: OneToOne){
        reportLabel.text = oneToOne.report
        statusLabel.text = oneToOne.status
        answerLabel.text = oneToOne.answer
        dateLabel.text = oneToOne.date
    }
}
