//
//  AnnoucementHeaderView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/20/24.
//

import UIKit
import SnapKit

protocol AnnouncementHeaderViewDelegate: AnyObject {
    func expandCollapseMessage(id: Int)
}

class AnnouncementHeaderView: UITableViewHeaderFooterView {

    static let identifier = "AnnoucementHeaderView"
    weak var delegate: AnnouncementHeaderViewDelegate?
    var id: Int?
    
    private let headlineLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = UIColor.color2e2e2e
        label.numberOfLines = 1
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let newIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8.5
        imageView.image = UIImage(systemName: "n.circle.fill")?.withTintColor(UIColor.colorfa4e29)
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular13Font
        label.textColor = UIColor.color9b9b9b
        label.numberOfLines = 1
        return label
    }()
    
    private let expandCollapseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "expand"), for: .normal)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(headlineLabel)
        contentView.addSubview(newIconImageView)
        contentView.addSubview(dateLabel)
        expandCollapseButton.addTarget(self, action: #selector(didTapExpandCollapse), for: .touchUpInside)
        contentView.addSubview(expandCollapseButton)
    }
    
    private func applyConstraints() {
        headlineLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23.4)
            make.leading.equalToSuperview().offset(26)
            make.trailing.lessThanOrEqualTo(newIconImageView.snp.leading).offset(-4)
            make.height.equalTo(19)
        }

        newIconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24.2)
            make.width.height.equalTo(17)
        }

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(headlineLabel.snp.bottom).offset(9)
            make.leading.equalToSuperview().offset(26)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(15)
        }

        expandCollapseButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30.4)
            make.trailing.equalToSuperview().inset(28)
            make.width.equalTo(14)
            make.height.equalTo(7)
        }
    }

    
    func configure(announcement: Annoucement?, faq: FAQ?){
        if let announcement {
            id = announcement.id
            headlineLabel.text = announcement.headline
            newIconImageView.isHidden = announcement.isRead
            announcement.isExpanded ? expandCollapseButton.setImage(UIImage(named: "collapse"), for: .normal) : expandCollapseButton.setImage(UIImage(named: "expand"), for: .normal)
            dateLabel.text = announcement.date
        }else if let faq {
            id = faq.id

            headlineLabel.attributedText = polishText(fullText: faq.question)
            newIconImageView.isHidden = faq.isRead
            
            faq.isExpanded ? expandCollapseButton.setImage(UIImage(named: "collapse"), for: .normal) : expandCollapseButton.setImage(UIImage(named: "expand"), for: .normal)
            dateLabel.text = faq.date
        }
    }
    
    func polishText(fullText: String) -> NSAttributedString{
        let attributedString = NSMutableAttributedString(string: fullText)

        let orangeColor: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.colorfa4e29]

        let blackColor: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.color2e2e2e]


        attributedString.addAttributes(orangeColor, range: NSRange(location: 0, length: 2))

        attributedString.addAttributes(blackColor, range: NSRange(location: 2, length: fullText.count - 2))
        return attributedString
    }
    
    @objc private func didTapExpandCollapse(){
        if let id {
            delegate?.expandCollapseMessage(id: id)
        }
    }
}
