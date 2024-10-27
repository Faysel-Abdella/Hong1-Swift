//
//  AbeeGoToButton.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

/// 특정 뷰로 이동하는 버튼
final class AbeeGoToButton: BaseButton {
    
    private let title: String
    private let textColor: UIColor
    
    init(_ title: String, textColor: UIColor = .colorfa4e29) {
        self.title = title
        self.textColor = textColor
        super.init(frame: .zero)
    }
    
    override func configureAttributes() {
        let buttonImage = UIImage(named: "arrow_right_red")?.resize(to: CGSize(width: 10, height: 12)).withTintColor(textColor)
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = .clear
            configuration.baseForegroundColor = .clear
            
            configuration.image = buttonImage
            configuration.imagePlacement = .trailing
            configuration.imagePadding = 9.5
            configuration.contentInsets = .zero
            
            var titleContainer = AttributeContainer()
            titleContainer.font = .ptSemiBold16Font
            titleContainer.foregroundColor = textColor
            configuration.attributedTitle = AttributedString(title, attributes: titleContainer)
            
            self.configuration = configuration
        }
    }
}
