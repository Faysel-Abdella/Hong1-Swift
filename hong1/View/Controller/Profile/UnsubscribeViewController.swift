//
//  UnsubscribeViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit
import SnapKit

class UnsubscribeViewController: UIViewController {
    
    private var isListOfReasonsExpanded = false
    var reasonsByUser = [String]()
    
    private let potentialReasons = [
        "신뢰도가 낮음",
        "사용하기가 어러움",
        "쓸만한 서비스가 없음",
        "필요가 없어졌음",
        "다른 유사 서비스 이용"
    ]
    
    private let toUnsubscribeLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium16Font
        label.textColor = UIColor.color242424
        label.text = "탈퇴하기"
        label.numberOfLines = 1
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .ptExtraBold30Font
        let myString = """
        정말 꿀잼을
        탈퇴하실건가요?
        """
        let attributedString = NSMutableAttributedString(string: myString)
        let blackAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.color242424
        ]
        let orangeAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.colorfa4e29
        ]
        attributedString.addAttributes(blackAttributes, range: NSRange(location: 0, length: myString.count))
        attributedString.addAttributes(orangeAttributes, range: NSRange(location: 3, length: 2))
        
        label.attributedText = attributedString
        label.numberOfLines = 2
        return label
    }()
    
    private let requestLabel: UILabel = {
        let label = UILabel()
        label.font = .ptMedium16Font
        label.textColor = UIColor.colorc7c7c7
        label.text = "탈퇴하시는 이유를 알려주세요"
        label.numberOfLines = 1
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.allowsSelection = true
        table.register(ReasonSelectionHeaderView.self, forHeaderFooterViewReuseIdentifier: ReasonSelectionHeaderView.identifier)
        table.register(ReasonTableViewCell.self, forCellReuseIdentifier: ReasonTableViewCell.identifier)
        return table
    }()
    
    private let noteTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .ptBold18Font
        label.textColor = UIColor.color242424
        label.text = "유의사항"
        label.numberOfLines = 1
        return label
    }()
    private let noteStack = UIStackView()
    private let noteLabels: [UILabel] = {
        
        let notes = [
            "탈퇴하시면 지금껏 모으신 포인트가 모두 사라져 복구가 불가합니다",
            "탈퇴 고객의 개인정보는 관련 법령에 따라 일정 기간 안전하게 보관되며, 그 이후 자동 파기됩니다.",
            "탈퇴 최종 확인은 비밀번호 인증으로 진행됩니다."
        ]
        
        let labels = [UILabel(), UILabel(), UILabel()]
        var i = 0
        for label in labels {
            label.font = .ptRegular14Font
            label.textColor = UIColor.color8e8e8e
            label.text = notes[i]
            if i == 1 {
                label.numberOfLines = 2
            }
            i += 1
        }
        return labels
    }()
    
    private let checkButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.backgroundColor = UIColor.coloracacac
        button.isEnabled = false
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
        self.title = ""
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "close")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapClose))
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        view.addSubview(toUnsubscribeLabel)
        view.addSubview(questionLabel)
        view.addSubview(requestLabel)
        view.addSubview(tableView)
        view.addSubview(noteTitleLabel)
        
        noteStack.axis = .vertical
        noteStack.spacing = 10
        noteStack.distribution = .fillProportionally
        for noteLabel in noteLabels {
            noteStack.addArrangedSubview(noteLabel)
        }
        view.addSubview(noteStack)
        checkButton.addTarget(self, action: #selector(didTapCheck), for: .touchUpInside)
        view.addSubview(checkButton)
        
    }
    
    private func applyConstraints() {
        toUnsubscribeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(33)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-33)
            make.height.equalTo(19)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(toUnsubscribeLabel.snp.bottom).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(31)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-31)
            make.height.equalTo(74)
        }
        
        requestLabel.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(17)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(33)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-33)
            make.height.equalTo(19)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(requestLabel.snp.bottom).offset(22)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(21.7)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-21.7)
            make.bottom.equalTo(noteTitleLabel.snp.top).offset(75)
        }
        
        noteTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(27)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-27)
            make.height.equalTo(21)
        }
        
        noteStack.snp.makeConstraints { make in
            make.top.equalTo(noteTitleLabel.snp.bottom).offset(16.4)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(35)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-35)
            make.bottom.equalTo(checkButton.snp.top).offset(-54)
        }
        
        checkButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(73)
        }
    }
    
    func enableChecking(){
        if !reasonsByUser.isEmpty{
            checkButton.isEnabled = true
            checkButton.backgroundColor = UIColor.colorfa4e29
        }
    }
    
    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapClose(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapCheck(){
        let successMessageVC = SuccessMessageViewController()
        navigationController?.pushViewController(successMessageVC, animated: true)
    }

}


extension UnsubscribeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isListOfReasonsExpanded ? 5 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReasonTableViewCell.identifier, for: indexPath) as? ReasonTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(reason: potentialReasons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reasonsByUser.append(potentialReasons[indexPath.row])
        enableChecking()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ReasonSelectionHeaderView.identifier) as? ReasonSelectionHeaderView else {
            return nil
        }
        headerView.delegate = self
        headerView.configure(isExpanded: isListOfReasonsExpanded)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 63
    }
    
    
}

extension UnsubscribeViewController: ReasonSelectionHeaderViewDelegate {
    func expandCollapseListOfReasons() {
        isListOfReasonsExpanded.toggle()
        
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
    
    
}
