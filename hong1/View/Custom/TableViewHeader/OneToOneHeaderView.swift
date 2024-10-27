//
//  OneToOneHeaderView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/21/24.
//

import UIKit
import SnapKit

class OneToOneHeaderView: UITableViewHeaderFooterView {

    static let identifier = "OneToOneHeaderView"
    
    private let tableTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold14Font
        label.textColor = UIColor.color9b9b9b
        label.text = "문의 내역"
        return label
    }()
    
    private let timeRangeLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold14Font
        label.textColor = UIColor.color242424
        label.text = "1개월"
        return label
    }()
    
    private let expandTimeRangeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "expand")
        imageView.tintColor = .color8e8e8e
        imageView.contentMode = .center
        return imageView
    }()
    
  
    private let limitLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold14Font
        label.textColor = UIColor.color242424
        label.text = "전체"
        return label
    }()
    
    private let expandLimitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.tintColor = .color8e8e8e
        imageView.image = UIImage(named: "expand")
        return imageView
    }()
    
    private let timeRangeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8.9
        stack.distribution = .fillProportionally
        stack.isUserInteractionEnabled = true
        return stack
    }()
    
    private let limitStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8.9
        stack.distribution = .fillProportionally
        stack.isUserInteractionEnabled = true
        return stack
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
        contentView.addSubview(tableTitleLabel)
        timeRangeStack.addArrangedSubview(timeRangeLabel)
        timeRangeStack.addArrangedSubview(expandTimeRangeImageView)
        contentView.addSubview(timeRangeStack)
        limitStack.addArrangedSubview(limitLabel)
        limitStack.addArrangedSubview(expandLimitImageView)
        contentView.addSubview(limitStack)
    }
    
    private func applyConstraints() {
        tableTitleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(14.2)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(timeRangeStack.snp.leading).offset(-5)
            make.height.equalTo(16)
        }

        expandTimeRangeImageView.snp.makeConstraints { make in
            make.width.equalTo(10.2)
        }

        expandLimitImageView.snp.makeConstraints { make in
            make.width.equalTo(10.2)
        }

        timeRangeStack.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(14.2)
            make.trailing.equalTo(limitStack.snp.leading).offset(-13.9)
            make.width.equalTo(70)
            make.height.equalTo(16)
        }

        limitStack.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(14.2)
            make.trailing.equalToSuperview().inset(26.9)
            make.width.equalTo(70)
            make.height.equalTo(16)
        }
    }

}
