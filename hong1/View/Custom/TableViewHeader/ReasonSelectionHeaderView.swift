//
//  ReasonSelectionHeaderView.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit

protocol ReasonSelectionHeaderViewDelegate: AnyObject {
    func expandCollapseListOfReasons()
}

class ReasonSelectionHeaderView: UITableViewHeaderFooterView {

    static let identifier = "ReasonSelectionHeaderView"
    weak var delegate: ReasonSelectionHeaderViewDelegate?
    
    private let selectReasonLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium16Font
        label.textColor = UIColor.color969696
        label.numberOfLines = 1
        label.text = "이유를 선택해 주세요."
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
        applyConstratins()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews(){
        contentView.backgroundColor = UIColor.colorf6f6f6
        contentView.layer.cornerRadius = 8
        contentView.addSubview(selectReasonLabel)
        expandCollapseButton.addTarget(self, action: #selector(didTapExpandCollapse), for: .touchUpInside)
        contentView.addSubview(expandCollapseButton)
    }
    
    private func applyConstratins(){
        selectReasonLabel.translatesAutoresizingMaskIntoConstraints = false
        expandCollapseButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            selectReasonLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            selectReasonLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 26.3),
            selectReasonLabel.trailingAnchor.constraint(equalTo: expandCollapseButton.leadingAnchor, constant: -10),
            selectReasonLabel.heightAnchor.constraint(equalToConstant: 19),
            
            expandCollapseButton.topAnchor.constraint(equalTo: topAnchor, constant: 26.5),
            expandCollapseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.7),
            expandCollapseButton.widthAnchor.constraint(equalToConstant: 14),
            expandCollapseButton.heightAnchor.constraint(equalToConstant: 7)
        ])
    }
    
    @objc private func didTapExpandCollapse(){
        delegate?.expandCollapseListOfReasons()
    }
    
    func configure(isExpanded: Bool){
        isExpanded ? expandCollapseButton.setImage(UIImage(named: "collapse"), for: .normal) : expandCollapseButton.setImage(UIImage(named: "expand"), for: .normal)
    }
}
