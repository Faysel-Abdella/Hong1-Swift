//
//  AbeeCategoryButton.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

/// 전환용 탭 버튼(ex: 포인트 현황)
final class AbeeCategoryButton: BaseButton {
    
    private var title: String
    private var titleFont: UIFont
    private var deselectedTextColor: UIColor
    private var selectedTextColor: UIColor
    private var deselectedBackgroundColor: UIColor
    private var selectedBackgroundColor: UIColor
    private var deselectedBorderColor: UIColor
    private var selectedBorderColor: UIColor
    
    init(
        title: String,
        titleFont: UIFont = .ptSemiBold16Font ?? .boldSystemFont(ofSize: 16),
        deselectedTextColor: UIColor = .color2d2d2d,
        selectedTextColor: UIColor = .colorfa4e29,
        deselectedBackgroundColor: UIColor = .white,
        selectedBackgroundColor: UIColor = .colorfdeada,
        deselectedBorderColor: UIColor = .colord5d5d5,
        selectedBorderColor: UIColor = .colorfa4e29
    ) {
        self.title = title
        self.titleFont = titleFont
        self.deselectedTextColor = deselectedTextColor
        self.selectedTextColor = selectedTextColor
        self.deselectedBackgroundColor = deselectedBackgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.deselectedBorderColor = deselectedBorderColor
        self.selectedBorderColor = selectedBorderColor
        super.init(frame: .zero)
    }
    
    override func configureAttributes() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = deselectedBackgroundColor
            configuration.contentInsets = .init(top: 9, leading: 16, bottom: 9, trailing: 16)
            
            // Title 설정
            var titleContainer = AttributeContainer()
            titleContainer.font = titleFont
            titleContainer.foregroundColor = deselectedTextColor
            configuration.attributedTitle = AttributedString(title, attributes: titleContainer)
            
            self.configuration = configuration
            
            // 상태에 따른 속성 업데이트
            configurationUpdateHandler = { [weak self] button in
                guard let self else { return }
                
                // 버튼 상태에 따른 색상 결정
                let isSelected = button.state == .selected
                let textColor: UIColor = isSelected ? selectedTextColor : deselectedTextColor
                let backgroundColor: UIColor = isSelected ? selectedBackgroundColor : deselectedBackgroundColor
                let borderColor: UIColor = isSelected ? selectedBorderColor : deselectedBorderColor
                
                // Title text attributes 변경
                let attributesTransformer = UIConfigurationTextAttributesTransformer { attributes in
                    var updatedAttributes = attributes
                    updatedAttributes.foregroundColor = textColor
                    return updatedAttributes
                }
                
                // Configuration 업데이트
                var updatedConfiguration = button.configuration
                updatedConfiguration?.baseBackgroundColor = backgroundColor
                updatedConfiguration?.titleTextAttributesTransformer = attributesTransformer
                
                // 설정된 값을 버튼에 적용
                button.configuration = updatedConfiguration
                button.layer.borderColor = borderColor.cgColor
            }
            
            // 기본 설정
            self.clipsToBounds = true
            self.layer.borderWidth = 1
            self.layer.borderColor = deselectedBorderColor.cgColor
        }

    }
}
