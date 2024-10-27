//
//  LikeButton.swift
//  Bridge
//
//  Created by 엄지호 on 2023/09/26.
//

import UIKit

/// 좋아요 버튼
final class LikeButton: BaseButton {
    
    private let selectedImage = UIImage(named: "heart_ON")?.resize(to: CGSize(width: 25, height: 25))
    private let deselectedImage = UIImage(named: "heart_OFF")?.resize(to: CGSize(width: 25, height: 25))
    
    override var isSelected: Bool {
        didSet {
            updateImage()
        }
    }
    
    override func configureAttributes() {
        if #available(iOS 15.0, *) {
            
            var configuration = UIButton.Configuration.plain()
            configuration.baseBackgroundColor = .clear
            configuration.baseForegroundColor = .clear
            configuration.contentInsets = .zero
            configuration.image = deselectedImage
            
            self.configuration = configuration
        }
    }
    
    private func updateImage() {
        if #available(iOS 15, *) {
            configuration?.image = isSelected ? selectedImage : deselectedImage
        }
    }
}
