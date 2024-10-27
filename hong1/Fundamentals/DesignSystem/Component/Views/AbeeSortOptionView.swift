//
//  AbeeSortOptionView.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit
import SnapKit

/// 정렬 옵션을 나타내는 뷰
final class AbeeSortOptionView: BaseView {
    // MARK: - UI
    private let firstSortOptionButton: AbeeTabButton
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .colore2e2e2
        return view
    }()
    
    private let secondSortOptionButton: AbeeTabButton
    
    // MARK: - Property
    weak var delegate: AbeeSortOptionViewDelegate?
    
    init(sortOptions: (String, String)) {
        firstSortOptionButton = AbeeTabButton(title: sortOptions.0, textFont: .ptSemiBold12Font)
        secondSortOptionButton = AbeeTabButton(title: sortOptions.1, textFont: .ptSemiBold12Font)
        super.init(frame: .zero)
    }
    
    // MARK: - Configuration
    override func configureAttributes() {
        backgroundColor = .white
        firstSortOptionButton.isSelected = true
        firstSortOptionButton.addTarget(self, action: #selector(firstSortOptionButtonTapped), for: .touchUpInside)
        secondSortOptionButton.addTarget(self, action: #selector(secondSortOptionButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Layout
    override func configureLayouts() {
        addSubview(firstSortOptionButton)
        addSubview(dividerView)
        addSubview(secondSortOptionButton)
        
        firstSortOptionButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(15)
        }
        
        dividerView.snp.makeConstraints { make in
            make.centerY.equalTo(firstSortOptionButton)
            make.left.equalTo(firstSortOptionButton.snp.right).offset(7)
            make.width.equalTo(1)
            make.height.equalTo(15)
        }
        
        secondSortOptionButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(dividerView.snp.right).offset(7)
            make.height.equalTo(15)
        }
    }
    
    // MARK: - ButtonMethod
    @objc private func firstSortOptionButtonTapped(_ sender: UIButton) {
        firstSortOptionButton.isSelected = true
        secondSortOptionButton.isSelected = false
        delegate?.firstSortOptionButtonTapped()
    }
    
    @objc private func secondSortOptionButtonTapped(_ sender: UIButton) {
        firstSortOptionButton.isSelected = false
        secondSortOptionButton.isSelected = true
        delegate?.secondSortOptionButtonTapped()
    }
}

// MARK: - 델리게이트 처리
protocol AbeeSortOptionViewDelegate: AnyObject {
    func firstSortOptionButtonTapped()
    func secondSortOptionButtonTapped()
}
