//
//  AbeeTagButton.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

/// 태그 버튼(라벨용임)
final class AbeeTagButton: BaseButton {
    
    private let title: String
    private let textColor: UIColor
    private let textFont: UIFont?
    private let borderColor: UIColor
    private let contentInsets: NSDirectionalEdgeInsets
    
    init(
        _ title: String,
        textColor: UIColor = .colorff4a00,
        textFont: UIFont? = .ptBold10Font,
        borderColor: UIColor = .colorff4a00,
        backgroundColor: UIColor = .white,
        contentInsets: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
    ) {
        self.title = title
        self.textColor = textColor
        self.textFont = textFont
        self.borderColor = borderColor
        self.contentInsets = contentInsets
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
    
    override func configureAttributes() {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = .clear
            configuration.baseForegroundColor = .clear
            configuration.contentInsets = contentInsets
            
            var titleContainer = AttributeContainer()
            titleContainer.font = textFont
            titleContainer.foregroundColor = textColor
            configuration.attributedTitle = AttributedString(title, attributes: titleContainer)
            
            self.configuration = configuration
            layer.cornerRadius = 16
            clipsToBounds = true
            layer.borderWidth = 0.8
            layer.borderColor = borderColor.cgColor
        }
    }
    
    func updateTitle(with title: String) {
        if #available(iOS 15, *) {
            var titleContainer = AttributeContainer()
            titleContainer.font = textFont
            titleContainer.foregroundColor = textColor
            configuration?.attributedTitle = AttributedString(title, attributes: titleContainer)
        }
    }
}
