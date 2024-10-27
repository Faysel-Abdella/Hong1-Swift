//
//  OneToOneViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/21/24.
//

import UIKit
import SnapKit

struct OneToOne {
    let report: String
    let status: String
    let answer: String
    let date: String
}

class OneToOneViewController: UIViewController {

    let demoOneToOne = OneToOne(report: "광고가 안나와요.", status: "답변 완료", answer: """
        안녕하세요. 아비입니다.
        · 점검 일시 : 2023년 12월 19(화) 00:00 ~ 03:00
        · 점검 내용 : 벌 광고 안정화
        · 중단 서비스 : 벌 광고
        서비스 점검으로 벌 광고 서비스가 제한됩니다.
        이 점 양해 부탁드립니다.
        감사합니다.
        """, date: "2024. 06. 10")
    
    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular14Font
        label.textColor = UIColor.color8e8e8e
        label.text = """
        자주 묻는 질물을 통해 충분한 답변이 되지 못한 분들께
        확인 후 신속학 답변드리겠습니다.
        """
        label.numberOfLines = 2
        return label
    }()
    
    private let oneToOneInquiryButton: UIButton = {
        let button = UIButton()
        button.setTitle("1:1문의 하기", for: .normal)
        button.setTitleColor(.color8e8e8e, for: .normal)
        button.backgroundColor = .coloreff1f5
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let customerCenterButton: UIButton = {
        let button = UIButton()
        button.setTitle("고객센터 전화", for: .normal)
        button.setTitleColor(.color8e8e8e, for: .normal)
        button.backgroundColor = .coloreff1f5
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32.4
        return stack
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(OneToOneHeaderView.self, forHeaderFooterViewReuseIdentifier: OneToOneHeaderView.identifier)
        table.register(OneToOneTableViewCell.self, forCellReuseIdentifier: OneToOneTableViewCell.identifier)
        return table
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
        self.title = "1:1 문의"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        oneToOneInquiryButton.addTarget(self, action: #selector(didTapOneToOneInquiry), for: .touchUpInside)
        buttonStack.addArrangedSubview(oneToOneInquiryButton)
        buttonStack.addArrangedSubview(customerCenterButton)
        
        verticalStack.addArrangedSubview(noticeLabel)
        verticalStack.addArrangedSubview(buttonStack)
        view.addSubview(verticalStack)
        view.addSubview(tableView)
    }
    
    
    private func applyConstraints() {
        noticeLabel.snp.makeConstraints { make in
            make.height.equalTo(36)
        }

        buttonStack.snp.makeConstraints { make in
            make.height.equalTo(39.6)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(13.2)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            // make.height.equalTo(108)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(verticalStack.snp.bottom).offset(59)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    
    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapOneToOneInquiry(){
        let inquiryViewController = OneToOneInquiryViewController()
        navigationController?.pushViewController(inquiryViewController, animated: true)
    }

}

extension OneToOneViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OneToOneTableViewCell.identifier, for: indexPath) as? OneToOneTableViewCell else {
            return UITableViewCell()
        }
        
       
        cell.configure(oneToOne: demoOneToOne)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 369.5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: OneToOneHeaderView.identifier) as? OneToOneHeaderView else {
            return UIView()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
