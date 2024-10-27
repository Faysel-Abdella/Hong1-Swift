//
//  EventTableHeaderView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/21/24.
//

import UIKit
import SnapKit

class EventTableHeaderView: UITableViewHeaderFooterView {

    static let identifier = "EventTableHeaderView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "모든 이벤트"
        label.font = .ptExtraBold28Font
        label.textColor = .color242424
        return label
    }()
    
    private let inProgressButton: UIButton = {
        let button = UIButton()
        button.setTitle("진행중", for: .normal)
        button.titleLabel?.font = .ptBold13Font
        button.setTitleColor(UIColor.colorfa4e29, for: .normal)
        button.layer.cornerRadius = 19
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.colorfa4e29.cgColor
        button.backgroundColor = UIColor.colorfdeada
        return button
    }()
    
    private let completeButton: UIButton = {
        let button = UIButton()
        button.setTitle("종료", for: .normal)
        button.titleLabel?.font = .ptBold13Font
        button.setTitleColor(UIColor.color8e8e8e, for: .normal)
        button.layer.cornerRadius = 19
        button.backgroundColor = UIColor.colorf5f5f5
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(inProgressButton)
        contentView.addSubview(completeButton)
    }
    
    private func applyConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(inProgressButton.snp.leading).offset(-20.5)
            make.height.equalTo(33)
        }

        inProgressButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalTo(completeButton.snp.leading).offset(-7)
            make.width.equalTo(60.6)
            make.height.equalTo(31.5)
        }

        completeButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(20.3)
            make.width.equalTo(60.6)
            make.height.equalTo(31.5)
        }
    }
}
