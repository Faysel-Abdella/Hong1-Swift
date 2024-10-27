//
//  AbeeIconTextButton.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

/// 아이콘과 텍스트가 같이 있는 버튼
final class AbeeIconTextButton: BaseButton {
    
    private let title: String
    private let textColor: UIColor
    private let textFont: UIFont?
    private let image: UIImage?
    private let imagePadding: CGFloat
    
    init(
        _ title: String,
        textColor: UIColor = .white,
        textFont: UIFont? = .ptBold12Font,
        backgroundColor: UIColor = .colorfe5c02,
        image: UIImage? = UIImage(named: "call")?.resize(to: CGSize(width: 16, height: 16)),
        imagePadding: CGFloat = 7
    ) {
        self.title = title
        self.textColor = textColor
        self.textFont = textFont
        self.image = image
        self.imagePadding = imagePadding
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    override func configureAttributes() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = .clear
            configuration.baseForegroundColor = .clear
            
            configuration.image = image
            configuration.imagePlacement = .leading
            configuration.imagePadding = imagePadding
            configuration.contentInsets = .zero
            
            var titleContainer = AttributeContainer()
            titleContainer.font = textFont
            titleContainer.foregroundColor = textColor
            configuration.attributedTitle = AttributedString(title, attributes: titleContainer)
            
            self.configuration = configuration
            self.clipsToBounds = true
            self.layer.cornerRadius = 6
        }
    }
}
