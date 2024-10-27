//
//  AbeeDayButton.swift
//  Bridge
//
//  Created by 엄지호 on 2023/09/26.
//

import UIKit

/// 시간 설정 버튼
final class AbeeSelectHoursButton: BaseButton {
    
    private let title: String
    
    init(_ title: String) {
        self.title = title
        super.init(frame: .zero)
    }
    
    override func configureAttributes() {
        let buttonImage = UIImage(named: "arrow_right_red")?.resize(to: CGSize(width: 10, height: 12)).withTintColor(.color242424)
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = .clear
            configuration.baseForegroundColor = .clear
            
            configuration.image = buttonImage
            configuration.imagePlacement = .trailing
            configuration.imagePadding = 10
            configuration.contentInsets = .zero
            
            var titleContainer = AttributeContainer()
            titleContainer.font = .ptSemiBold13Font
            titleContainer.foregroundColor = .color242424
            configuration.attributedTitle = AttributedString(title, attributes: titleContainer)
            
            self.configuration = configuration
        }
    }
}
