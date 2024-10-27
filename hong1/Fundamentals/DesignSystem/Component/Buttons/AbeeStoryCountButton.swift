//
//  AbeeStoryCountButton.swift
//  Bridge
//
//  Created by 엄지호 on 2023/09/26.
//

import UIKit

/// 꿀잼 스토리에서 특정 갯수를 알려주는 버튼
final class AbeeStoryCountButton: BaseButton {
    
    private let count: String
    private let textFont: UIFont?
    private let textColor: UIColor
    private let selectedImage: UIImage?
    private let deselectedImage: UIImage?
    private let imagePadding: CGFloat
    private let imageSize: CGSize
    
    override var isSelected: Bool {
        didSet {
            updateImage()
        }
    }
    
    init(
        _ count: String,
        textFont: UIFont? = .ptRegular14Font,
        textColor: UIColor = .color717171,
        selectedImage: UIImage?,
        deselectedImage: UIImage?,
        imagePadding: CGFloat = 7.5,
        imageSize: CGSize = CGSize(width: 25, height: 25)
    ) {
        self.count = count
        self.textFont = textFont
        self.textColor = textColor
        self.selectedImage = selectedImage
        self.deselectedImage = deselectedImage
        self.imagePadding = imagePadding
        self.imageSize = imageSize
        super.init(frame: .zero)
    }
    
    override func configureAttributes() {
        let buttonImage = deselectedImage?.resize(to: imageSize)
        
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.filled()
            configuration.baseBackgroundColor = .clear
            configuration.baseForegroundColor = .clear
            
            configuration.image = buttonImage
            configuration.imagePlacement = .leading
            configuration.imagePadding = imagePadding
            configuration.contentInsets = .zero
            
            var titleContainer = AttributeContainer()
            titleContainer.font = textFont
            titleContainer.foregroundColor = textColor
            configuration.attributedTitle = AttributedString(count, attributes: titleContainer)
            
            self.configuration = configuration
        }
    }
    
    func updateCount(with count: String) {
        if #available(iOS 15, *) {
            var titleContainer = AttributeContainer()
            titleContainer.font = textFont
            titleContainer.foregroundColor = textColor
            configuration?.attributedTitle = AttributedString(count, attributes: titleContainer)
        }
    }
    
    private func updateImage() {
        let buttonImage = isSelected ? selectedImage : deselectedImage
        if #available(iOS 15.0, *) {
            configuration?.image = buttonImage?.resize(to: imageSize)
        }
    }
}
