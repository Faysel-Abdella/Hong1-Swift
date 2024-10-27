//
//  PartnershipInquiriesViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/22/24.
//

import UIKit
import SnapKit

class PartnershipInquiriesViewController: UIViewController {
    
    private var isListOfAccountsExpanded = false
    
    private let explanationLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color8e8e8e
        label.numberOfLines = .zero
        label.text = """
        벌을 잡아 고액으 리워드 포인트를 제공하며,
        선순환 구조 자동광고 시스템을 개발하여 중소상공들과의
        상생을 위한 Multi Platform광고를 소개합니다.
        """
        return label
    }()
    
    private let customerCenterPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color8e8e8e
        label.text = "고객센터  |  1833 - 8590 (09:00 ~ 18:00 점심시간 제외)"
        return label
    }()
    
    private let customerCenterEmailLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = .color8e8e8e
        label.text = "이메일  |  tum0808@naver.com"
        return label
    }()
    
    private let inquiryDetailsLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold18Font

        let text = "문의 내용*"
        let attributedString = NSMutableAttributedString(string: text)
        
        attributedString.addAttribute(.foregroundColor, value: UIColor.color242424, range: NSRange(location: 0, length: text.count - 1))
        
        if let lastCharacterRange = text.range(of: "*", options: .backwards) {
            let nsRange = NSRange(lastCharacterRange, in: text)
            attributedString.addAttribute(.foregroundColor, value: UIColor.colorff0000, range: nsRange)
        }
        
        label.attributedText = attributedString
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(AccountSelectionHeaderView.self, forHeaderFooterViewReuseIdentifier: AccountSelectionHeaderView.identifier)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let inquiryDetailsTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.colorebebeb.cgColor
        return textView
    }()
    
    private let checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.backgroundColor = UIColor.colorfa4e29
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableView()
        setUpViews()
        applyConstraints()
    }
    
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "제휴 및 광고 문의"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        view.addSubview(explanationLabel)
        view.addSubview(customerCenterPhoneNumberLabel)
        view.addSubview(customerCenterEmailLabel)
        view.addSubview(inquiryDetailsLabel)
        view.addSubview(tableView)
        view.addSubview(inquiryDetailsTextView)
        view.addSubview(checkButton)
    }
    
    private func applyConstraints() {
        
        explanationLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(13.2)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(56)
        }
        
        customerCenterPhoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(explanationLabel.snp.bottom).offset(11)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(16)
        }
        
        customerCenterEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(customerCenterPhoneNumberLabel.snp.bottom).offset(3)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(16)
        }
        
        inquiryDetailsLabel.snp.makeConstraints { make in
            make.top.equalTo(customerCenterEmailLabel.snp.bottom).offset(60.9)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(21)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(inquiryDetailsLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(inquiryDetailsTextView.snp.top).offset(-5.5)
        }
        
        inquiryDetailsTextView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(215.5)
            make.bottom.equalTo(checkButton.snp.top).offset(-100)
        }
        
        checkButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(73)
        }
    }
    
    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
}

extension PartnershipInquiriesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isListOfAccountsExpanded ? 5 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Account \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: AccountSelectionHeaderView.identifier) as? AccountSelectionHeaderView else{
            return UIView()
        }
        
        headerView.delegate = self
        headerView.configure(isExpanded: isListOfAccountsExpanded)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 63.5
    }
}

extension PartnershipInquiriesViewController: AccountSelectionHeaderViewDelegate {
    
    func expandCollapseListOfAccounts() {
        isListOfAccountsExpanded.toggle()
        
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
}

