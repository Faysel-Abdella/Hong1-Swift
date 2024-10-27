//
//  RegionTableHeaderView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit
import SnapKit

protocol RegionTableHeaderViewDelegate: AnyObject {
    func collapseModal()
}

class RegionTableHeaderView: UITableViewHeaderFooterView {

    static let identifier = "RegionTableHeaderView"
    weak var delegate: RegionTableHeaderViewDelegate?
    
    private let promptLabel: UILabel = {
        let label = UILabel()
        label.font = .ptExtraBold18Font
        label.textColor = UIColor.color242424
        label.numberOfLines = 1
        label.text = "지역을 선택해 주세요"
        return label
    }()
    
    private let reminderLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium14Font
        label.textColor = UIColor.color8e8e8e
        label.numberOfLines = 1
        label.text = "중복 선택 가능합니다"
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
        addSubview(promptLabel)
        addSubview(reminderLabel)
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        addSubview(closeButton)
    }
    
    private func applyConstraints() {
        promptLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalTo(closeButton.snp.leading).offset(-100)
            make.height.equalTo(21)
        }

        reminderLabel.snp.makeConstraints { make in
            make.top.equalTo(promptLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(100)
            make.height.equalTo(16)
        }

        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().inset(14)
            make.width.height.equalTo(28)
        }
    }

    
    @objc private func didTapClose(){
        delegate?.collapseModal()
    }
}
