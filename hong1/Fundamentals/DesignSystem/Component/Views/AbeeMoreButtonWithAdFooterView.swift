//
//  AbeeMoreButtonWithAdFooterView.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit
import SnapKit

/// 더보기 버튼과 광고가 함께있는 Footer 뷰
final class AbeeMoreButtonWithAdFooterView: BaseCollectionReusableView {
    // MARK: - UI
    private let showMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.color878d93, for: .normal)
        button.titleLabel?.font = .ptSemiBold15Font
        button.backgroundColor = .coloreff3f5
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        return button
    }()
    
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
        addSubview(showMoreButton)
        addSubview(adBannerImageView)
        
        showMoreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(6)
            make.left.right.equalToSuperview()
            make.height.equalTo(52)
        }
        
        adBannerImageView.snp.makeConstraints { make in
            make.top.equalTo(showMoreButton.snp.bottom).offset(21)
            make.left.right.equalToSuperview()
            make.height.equalTo(109)
        }
    }
}
