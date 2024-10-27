//
//  AbeeCountButton.swift
//  Bridge
//
//  Created by 엄지호 on 2023/09/26.
//

import UIKit

/// 특정 갯수를 보여주는 버튼 (라벨용)
final class AbeeCountButton: BaseButton {
    
    private let image: UIImage?
    private let count: String
    
    init(_ count: String, image: UIImage?) {
        self.count = count
        self.image = image
        super.init(frame: .zero)
    }
    
    override func configureAttributes() {
        let buttonImage = image?.resize(to: CGSize(width: 13, height: 13))
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = .clear
            configuration.baseForegroundColor = .clear
            
            configuration.image = buttonImage
            configuration.imagePlacement = .leading
            configuration.imagePadding = 3
            configuration.contentInsets = .zero
            
            var titleContainer = AttributeContainer()
            titleContainer.font = .ptRegular12Font
            titleContainer.foregroundColor = .color9b9b9b
            configuration.attributedTitle = AttributedString(count, attributes: titleContainer)
            
            self.configuration = configuration
        }
    }
    
    func updateCount(with count: String) {
        if #available(iOS 15, *) {
            var titleContainer = AttributeContainer()
            titleContainer.font = .ptRegular12Font
            titleContainer.foregroundColor = .color9b9b9b
            configuration?.attributedTitle = AttributedString(count, attributes: titleContainer)
        }
    }
}
