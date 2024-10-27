//
//  MyInformationTableViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit
import SnapKit

protocol MyInformationTableViewCellDelegate: AnyObject {
    func didTapEditLabel(_ cell: MyInformationTableViewCell)
}

class MyInformationTableViewCell: UITableViewCell {
    
    static let identifier = "MyInformationTableViewCell"
    weak var delegate: MyInformationTableViewCellDelegate?
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold18Font
        label.textColor = UIColor.color242424
        label.numberOfLines = 1
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = UIColor.color747474
        label.numberOfLines = 1
        return label
    }()
    
    private let editLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold14Font
        label.textColor = UIColor.colorfa4e29
        label.numberOfLines = 1
        label.text = "수정하기"
        label.isHidden = true
        label.isUserInteractionEnabled = true
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
        contentView.addSubview(informationLabel)
        contentView.addSubview(valueLabel)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editLabelTapped))
        editLabel.addGestureRecognizer(tapGesture)
        contentView.addSubview(editLabel)
    }
    
    private func applyConstraints() {
        informationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.6)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(editLabel.snp.leading).offset(-10)
            make.height.equalTo(21)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(informationLabel.snp.bottom).offset(9.3)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(editLabel.snp.leading).offset(-10)
            make.height.equalTo(19)
        }
        
        editLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23.6)
            make.trailing.equalToSuperview().offset(-22)
            make.width.equalTo(50)
            make.height.equalTo(16)
        }
    }

    
    func configure(information: String, value: String){
        informationLabel.text = information
        valueLabel.text = value
        if information == "지역"{
            editLabel.isHidden = false
        }
    }
    
    @objc private func editLabelTapped() {
        guard !editLabel.isHidden else { return }
        // Notify the view controller that the edit label was tapped.
        delegate?.didTapEditLabel(self)
    }

}
