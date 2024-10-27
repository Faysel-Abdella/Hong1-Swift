//
//  AbeeCategoryRadioButton.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

/// 카테고리를 선택하는 체크 레이디오 버튼
final class AbeeCategoryRadioButton: BaseButton {
    
    private let selectedColor: UIColor
    
    override var isSelected: Bool {
        didSet {
            updateButtonStyle()
        }
    }
    
    init(
        selectedColor: UIColor = .colorfa4e29
    ) {
        self.selectedColor = selectedColor
        super.init(frame: .zero)
    }
    
    override func configureAttributes() {
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 25 / 2
        layer.borderWidth = 1
        layer.borderColor = UIColor.colord5d5d5.cgColor
    }
    
    private func updateButtonStyle() {
        let buttonImage: UIImage? = isSelected ? UIImage(named: "check2")?.resize(to: CGSize(width: 13, height: 10)) : .none
        
        setImage(buttonImage, for: .normal)
        backgroundColor = isSelected ? selectedColor : .white
        layer.borderWidth = isSelected ? .zero : 1
    }
}
