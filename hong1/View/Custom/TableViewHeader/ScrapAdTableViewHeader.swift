//
//  ScrapAdTableViewHeader.swift
//  hong1
//
//  Created by Yohannes Haile on 10/18/24.
//

import UIKit
import SnapKit

class ScrapAdTableViewHeader: UITableViewHeaderFooterView {

    static let identifier = "ScrapAdTableViewHeader"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular12Font
        label.textColor = UIColor.color8e8e8e
        label.text = "스크랩 광고"
        label.numberOfLines = 1
        return label
    }()
    
    let ascendingLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold12Font
        label.textColor = UIColor.color2d2d2d
        label.text = "스크랩 광고"
        label.numberOfLines = 1
        return label
    }()
    
    let decendingLabel:  UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold12Font
        label.textColor = UIColor.color7b7f82
        label.text = "날짜 오름차순"
        label.numberOfLines = 1
        return label
    }()
    
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.color707070
        return view
    }()
    
    private let sortStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 6.5
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
        addSubview(titleLabel)
        sortStack.addArrangedSubview(ascendingLabel)
        sortStack.addArrangedSubview(divider)
        sortStack.addArrangedSubview(decendingLabel)
        addSubview(sortStack)
    }
    
    private func applyConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(29)
            make.leading.equalToSuperview().offset(23)
            make.trailing.equalTo(sortStack.snp.leading).inset(5)
            make.height.equalTo(19)
        }

        divider.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(sortStack.snp.height)
        }

        sortStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(33)
            make.trailing.equalToSuperview().inset(26)
            make.width.equalTo(140)
            make.height.equalTo(13)
        }
    }

}
