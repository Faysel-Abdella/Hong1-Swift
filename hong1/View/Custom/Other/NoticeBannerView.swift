//
//  NoticeBannerView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/17/24.
//

import UIKit
import SnapKit

class NoticeBannerView: UIView {
    
    private let archiveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "archive")
        return imageView
    }()
    
    private let noticeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold16Font
        label.textColor = UIColor.colordf5b20
        label.text = "광고 Keep하거나 Scarp하기"
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium12Font
        label.textColor = UIColor.color242424
        label.text = "미뤄둔  광고를 보고 스크랩한 광고를 시청해요"
        label.numberOfLines = 1
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "close"), for: .normal)
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
        backgroundColor = UIColor.colorf3f3f3
        layer.cornerRadius = 12
        addSubview(archiveImageView)
        addSubview(noticeTitleLabel)
        addSubview(descriptionLabel)
        closeButton.addTarget(self, action: #selector(closeBanner), for: .touchUpInside)
        addSubview(closeButton)
    }
    
    private func applyConstraints() {
        archiveImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(61)
        }

        noticeTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26)
            make.leading.equalTo(archiveImageView.snp.trailing).offset(21)
            make.trailing.equalTo(closeButton.snp.leading).offset(-10)
            make.height.equalTo(19)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(noticeTitleLabel.snp.bottom).offset(3)
            make.leading.equalTo(archiveImageView.snp.trailing).offset(20)
            make.trailing.equalTo(closeButton.snp.leading).offset(-10)
            make.height.equalTo(14)
        }

        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(37)
            make.trailing.equalToSuperview().inset(23)
            make.width.height.equalTo(14)
        }
    }

    
    @objc func closeBanner(){
       // Closing shall be delegated
    }
    
}
