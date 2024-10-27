//
//  AbeeAdvertisementFooterView.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit
import SnapKit

/// 광고 푸터뷰
final class AbeeAdvertisementFooterView: BaseCollectionReusableView {
    // MARK: - UI
    // TODO: - 광고 처리 후 조정
    private let adBannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ad")
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Property
    
    // MARK: - Layout
    override func configureLayouts() {
        addSubview(adBannerImageView)
        
        adBannerImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.right.equalToSuperview().inset(21)
            make.height.equalTo(109)
        }
    }
}
