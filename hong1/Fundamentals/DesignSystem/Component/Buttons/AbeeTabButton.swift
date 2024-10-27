//
//  AbeeTabButton.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

/// 전환용 탭 버튼(ex: 포인트 현황)
final class AbeeTabButton: BaseButton {
    
    private var title: String
    private var textFont: UIFont?
    private var deselectedTextColor: UIColor
    private var selectedTextColor: UIColor
    
    init(
        title: String,
        textFont: UIFont?,
        deselectedTextColor: UIColor = .color9b9b9b,
        selectedTextColor: UIColor = .color353b48
    ) {
        self.title = title
        self.textFont = textFont
        self.deselectedTextColor = deselectedTextColor
        self.selectedTextColor = selectedTextColor
        super.init(frame: .zero)
    }
    
    override func configureAttributes() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = .clear
            configuration.contentInsets = .zero
            
            var titleContainer = AttributeContainer()
            titleContainer.font = textFont
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

extension AbeeTabButton {
    func updateTitle(_ title: String) {
        if #available(iOS 15, *) {
            var titleContainer = AttributeContainer()
            titleContainer.font = textFont
            titleContainer.foregroundColor = deselectedTextColor
            configuration?.attributedTitle = AttributedString(title, attributes: titleContainer)
        }
    }
}
