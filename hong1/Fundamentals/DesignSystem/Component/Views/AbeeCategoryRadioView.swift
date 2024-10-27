//
//  AbeeCategoryRadioView.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//
//
//import UIKit
//import SnapKit
//
///// 카테고리를 선택하는 체크 레이디오 뷰
//final class AbeeCategoryRadioView: BaseView {
//    // MARK: - UI
//    private let radioButton = AbeeCategoryRadioButton()
//    
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .color242424
//        label.font = .ptRegular16Font
//        return label
//    }()
//    
//    // MARK: - Property
//    weak var delegate: AbeeCategoryRadioViewDelegate?
//    var isSelected: Bool {
//        didSet {
//            radioButton.isSelected = isSelected
//        }
//    }
//    
//    private let category: NeighborhoodCategory
//    
//    // MARK: - Init
//    init(_ title: String, category: NeighborhoodCategory) {
//        self.titleLabel.text = title
//        self.category = category
//        self.isSelected = false
//        super.init(frame: .zero)
//    }
//    
//    // MARK: - Configuration
//    override func configureAttributes() {
//        backgroundColor = .white
//        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(radioTapped))
//        addGestureRecognizer(tapGesture)
//    }
//    
//    // MARK: - Layout
//    override func configureLayouts() {
//        addSubview(radioButton)
//        addSubview(titleLabel)
//        
//        radioButton.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.left.equalToSuperview()
//            make.width.height.equalTo(25)
//        }
//        
//        titleLabel.snp.makeConstraints { make in
//            make.centerY.equalTo(radioButton)
//            make.left.equalTo(radioButton.snp.right).offset(8.5)
//            make.right.equalToSuperview()
//        }
//    }
//    
//    // MARK: - Tap Gesture
//    @objc private func radioTapped() {
//        delegate?.radioTapped(category: category)
//    }
//}
//
//// MARK: - 델리게이트 처리
//protocol AbeeCategoryRadioViewDelegate: AnyObject {
//    func radioTapped(category: NeighborhoodCategory)
//}
