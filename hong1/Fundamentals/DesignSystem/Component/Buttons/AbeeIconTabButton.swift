//
//  AbeeIconTabButton.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

/// 전환용 탭 버튼 아이콘을 곁들인
final class AbeeIconTabButton: BaseButton {
    
    private let title: String
    private let titleFont: UIFont?
    private let deselectedTextColor: UIColor
    private let selectedTextColor: UIColor
    private let iconImage: UIImage?
    
    init(
        title: String,
        titleFont: UIFont? = .ptMedium16Font,
        deselectedTextColor: UIColor = .color9b9b9b,
        selectedTextColor: UIColor = .color242424,
        iconImage: UIImage?
    ) {
        self.title = title
        self.titleFont = titleFont
        self.deselectedTextColor = deselectedTextColor
        self.selectedTextColor = selectedTextColor
        self.iconImage = iconImage
        super.init(frame: .zero)
    }
    
    override func configureAttributes() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = .clear
            configuration.contentInsets = .zero
            
            configuration.image = iconImage
            configuration.imagePlacement = .leading
            configuration.imagePadding = 8
            configuration.contentInsets = .zero
            
            var titleContainer = AttributeContainer()
            titleContainer.font = titleFont
            titleContainer.foregroundColor = deselectedTextColor
            configuration.attributedTitle = AttributedString(title, attributes: titleContainer)
            
            self.configuration = configuration
            configurationUpdateHandler = { [weak self] button in
                guard let self else { return }
                
                let textColor: UIColor = button.state == .selected ? selectedTextColor : deselectedTextColor
                
                let attributesTransformer = UIConfigurationTextAttributesTransformer { attributes in
                    var updatedAttributes = attributes
                    updatedAttributes.foregroundColor = textColor
                    return updatedAttributes
                }
                
                var updatedConfiguration = button.configuration
                updatedConfiguration?.titleTextAttributesTransformer = attributesTransformer
                
                button.configuration = updatedConfiguration
            }
        }
    }
}
