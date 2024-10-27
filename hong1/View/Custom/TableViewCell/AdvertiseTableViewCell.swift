//
//  AdvertiseTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/26/24.
//

import UIKit

protocol AdvertiseTableViewCellDelegate: AnyObject {
    func navigateToCreateAd()
    func navigateToAdList()
}

class AdvertiseTableViewCell: UITableViewCell {

    static let identifier = "AdvertiseTableViewCell"
    
    weak var delegate: AdvertiseTableViewCellDelegate?
    
    private let adBannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.image = UIImage(named: "simplead")
        return imageView
    }()
    
    private let numberOfFeaturesLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = .colorfa4e29
        label.text = "3가지 특징"
        return label
    }()
    
    private let requestLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold24Font
        label.textColor = .color242424
        label.text = """
            아비앱만의
            특별한 특징을 확인하고
            광고를 만들어보세요
            """
        label.numberOfLines = 3
        return label
    }()
    
    private let featureListLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular15Font
        label.textColor = .color929292
        label.numberOfLines = 3
        label.text = """
            · 내가 원하는 사람들에게 벌 광고를 날릴 수 있어요
            · 일주일에 한번 무료로 신청 가능해요
            · 승인 완료 일자에 따라 순차적으로 노출돼요
            """
        return label
    }()
    
    private let createAdButton: UIButton = {
        let button = UIButton()
        button.setTitle("광고만들기", for: .normal)
        button.setImage(UIImage(named: "arrowr")?.withTintColor(.white), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 158.3, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 93.4)
        button.titleLabel?.font = .ptSemiBold16Font
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .colorfa4e29
        button.layer.cornerRadius = 28
        button.layer.borderWidth = 0.2
        return button
    }()
    
    private let adStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("나의 광고 현황", for: .normal)
        button.setImage(UIImage(named: "arrowr")?.withTintColor(.color8e8e8e), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 158.3, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 72)
        button.titleLabel?.font = .ptSemiBold16Font
        button.setTitleColor(.color242424, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 28
        button.layer.borderWidth = 0.2
        return button
    }()
    
    private let promotionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.image = UIImage(named: "promotion")
        return imageView
    }()
    
    private let applyForSponsorshipButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "support"), for: .normal)
        let text = "꿀잼 후원기업 신청하기"
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.foregroundColor, value: UIColor.color0fc860, range: NSRange(location: 0, length: 5))
        attributedText.addAttribute(.foregroundColor, value: UIColor.color323232, range: NSRange(location: 6, length: 4))

        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 100.5, bottom: 0, right: 93.4)
        button.setAttributedTitle(attributedText, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.2
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpViews(){
        contentView.addSubview(adBannerImageView)
        contentView.addSubview(numberOfFeaturesLabel)
        contentView.addSubview(requestLabel)
        contentView.addSubview(featureListLabel)
        createAdButton.addTarget(self, action: #selector(didTapOnCreateAd), for: .touchUpInside)
        contentView.addSubview(createAdButton)
        adStatusButton.addTarget(self, action: #selector(didTapOnAdStatus), for: .touchUpInside)
        contentView.addSubview(adStatusButton)
        contentView.addSubview(promotionImageView)
        contentView.addSubview(applyForSponsorshipButton)
    }
    
    private func applyConstraints(){
        adBannerImageView.translatesAutoresizingMaskIntoConstraints = false
        numberOfFeaturesLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        featureListLabel.translatesAutoresizingMaskIntoConstraints = false
        createAdButton.translatesAutoresizingMaskIntoConstraints = false
        adStatusButton.translatesAutoresizingMaskIntoConstraints = false
        promotionImageView.translatesAutoresizingMaskIntoConstraints = false
        applyForSponsorshipButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            adBannerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            adBannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            adBannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            adBannerImageView.heightAnchor.constraint(equalToConstant: 70),
            
            numberOfFeaturesLabel.topAnchor.constraint(equalTo: adBannerImageView.bottomAnchor, constant: 45),
            numberOfFeaturesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27),
            numberOfFeaturesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27),
            numberOfFeaturesLabel.heightAnchor.constraint(equalToConstant: 19),
            
            requestLabel.topAnchor.constraint(equalTo: numberOfFeaturesLabel.bottomAnchor, constant: 15),
            requestLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26),
            requestLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            requestLabel.heightAnchor.constraint(equalToConstant: 116),
            
            featureListLabel.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 30.7),
            featureListLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            featureListLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            featureListLabel.heightAnchor.constraint(equalToConstant: 68),
            
            createAdButton.topAnchor.constraint(equalTo: featureListLabel.bottomAnchor, constant: 29.4),
            createAdButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            createAdButton.widthAnchor.constraint(equalToConstant: 188.4),
            createAdButton.heightAnchor.constraint(equalToConstant: 55),
            
            adStatusButton.topAnchor.constraint(equalTo: featureListLabel.bottomAnchor, constant: 29.4),
            adStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            adStatusButton.widthAnchor.constraint(equalToConstant: 188.4),
            adStatusButton.heightAnchor.constraint(equalToConstant: 55),
            
            promotionImageView.topAnchor.constraint(equalTo: createAdButton.bottomAnchor, constant: 34.9),
            promotionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
            promotionImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
            promotionImageView.heightAnchor.constraint(equalToConstant: 132.6),
            
            applyForSponsorshipButton.topAnchor.constraint(equalTo: promotionImageView.bottomAnchor, constant: 20.4),
            applyForSponsorshipButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.4),
            applyForSponsorshipButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.4),
            applyForSponsorshipButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    @objc private func didTapOnCreateAd(){
        delegate?.navigateToCreateAd()
    }
    @objc private func didTapOnAdStatus(){
        delegate?.navigateToAdList()
    }
    
}
