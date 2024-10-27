//
//  OneToOneInquiryViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/22/24.
//

import UIKit
import SnapKit

class OneToOneInquiryViewController: UIViewController {
    
    private var isListOfAccountsExpanded = false
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = .color2e2e2e
        label.text = "성명"
        return label
    }()
    
    private let nameValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular16Font
        label.textColor = UIColor.color585858
        label.text = "김아비"
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .ptSemiBold16Font
        label.textColor = .color2e2e2e
        label.text = "이메일"
        return label
    }()
    
    
    private let emailValueLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular16Font
        label.textColor = UIColor.color585858
        label.text = "abeelove@naver.com"
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
        self.title = "1:1 문의하기"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        view.addSubview(nameLabel)
        view.addSubview(nameValueLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailValueLabel)
        view.addSubview(inquiryDetailsLabel)
        view.addSubview(tableView)
        view.addSubview(inquiryDetailsTextView)
        view.addSubview(checkButton)
    }
    
    private func applyConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(23.5)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20.5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20.5)
            make.height.equalTo(19)
        }
        
        nameValueLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4.3)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(19)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameValueLabel.snp.bottom).offset(25.7)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20.5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20.5)
            make.height.equalTo(19)
        }
        
        emailValueLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(4.3)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(19)
        }
        
        inquiryDetailsLabel.snp.makeConstraints { make in
            make.top.equalTo(emailValueLabel.snp.bottom).offset(42.3)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(21)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(inquiryDetailsLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(inquiryDetailsTextView.snp.top).offset(-5.5) // Use a negative offset here
        }
        
        inquiryDetailsTextView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(215.5)
            make.bottom.lessThanOrEqualTo(checkButton.snp.top).offset(-100).priority(.high) // Adjusts with priority
              make.bottom.greaterThanOrEqualTo(checkButton.snp.top).offset(-10).priority(.low) // Allows shrinkage on smaller screens
        }
        
        checkButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(0)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(0)
            make.height.equalTo(73)
        }
    }

    
    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
}

extension OneToOneInquiryViewController: UITableViewDelegate, UITableViewDataSource {
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


extension OneToOneInquiryViewController: AccountSelectionHeaderViewDelegate {
    
    func expandCollapseListOfAccounts() {
        isListOfAccountsExpanded.toggle()
        
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
}
