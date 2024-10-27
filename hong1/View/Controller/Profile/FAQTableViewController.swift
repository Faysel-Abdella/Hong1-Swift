//
//  FAQViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/21/24.
//

import UIKit


struct FAQ {
    let id: Int
    let question: String
    let date: String
    let answer: String
    var isExpanded: Bool
    let isRead: Bool
}

class FAQTableViewController: UITableViewController {

    var faqs: [FAQ] = [
        FAQ(id: 0, question: "Q. [광고관련] 벌광고가 안나와요", date: "2024. 07. 15", answer: """
          Lorem Ipsum은 단순히 인쇄 및 조판 산업의 더미 텍스트입니다. Lorem Ipsum은 알려지지 않은 인쇄공이 갤리형 활자를 가져와 섞어서 활자 견본책을 만든 1500년대부터 업계의 표준 더미 텍스트가 되었습니다. 5세기 동안 살아남았을 뿐만 아니라 전자 조판으로의 도약에도 불구하고 본질적으로 변함없이 유지되었습니다. Lorem Ipsum 구절이 포함된 Letraset 시트가 출시된 1960년대에 대중화되었고, 최근에는 Aldus PageMaker와 같은 데스크톱 출판 소프트웨어에 Lorem Ipsum 버전이 포함되면서 대중화되었습니다.
          """
    , isExpanded: false, isRead: false),
        FAQ(id: 1, question: "Q. [코인관련] 전자지갑에는 어떤 기능들이 있나요?", date: "2024. 07. 05", answer: """
          Lorem Ipsum은 단순히 인쇄 및 조판 산업의 더미 텍스트입니다. Lorem Ipsum은 알려지지 않은 인쇄공이 갤리형 활자를 가져와 섞어서 활자 견본책을 만든 1500년대부터 업계의 표준 더미 텍스트가 되었습니다. 5세기 동안 살아남았을 뿐만 아니라 전자 조판으로의 도약에도 불구하고 본질적으로 변함없이 유지되었습니다. Lorem Ipsum 구절이 포함된 Letraset 시트가 출시된 1960년대에 대중화되었고, 최근에는 Aldus PageMaker와 같은 데스크톱 출판 소프트웨어에 Lorem Ipsum 버전이 포함되면서 대중화되었습니다.
          """
    , isExpanded: false, isRead: false),
        FAQ(id: 2, question: "Q. [코인관련] 아비코인 상장은 언제쯤 될까요?", date: "2024. 06. 10", answer: """
          Lorem Ipsum은 단순히 인쇄 및 조판 산업의 더미 텍스트입니다. Lorem Ipsum은 알려지지 않은 인쇄공이 갤리형 활자를 가져와 섞어서 활자 견본책을 만든 1500년대부터 업계의 표준 더미 텍스트가 되었습니다. 5세기 동안 살아남았을 뿐만 아니라 전자 조판으로의 도약에도 불구하고 본질적으로 변함없이 유지되었습니다. Lorem Ipsum 구절이 포함된 Letraset 시트가 출시된 1960년대에 대중화되었고, 최근에는 Aldus PageMaker와 같은 데스크톱 출판 소프트웨어에 Lorem Ipsum 버전이 포함되면서 대중화되었습니다.
          """
    , isExpanded: false, isRead: true),
        FAQ(id: 3, question: "Q. 납부신청을 했는데 거절당했어요.", date: "2024. 07. 15", answer: """
          Lorem Ipsum은 단순히 인쇄 및 조판 산업의 더미 텍스트입니다. Lorem Ipsum은 알려지지 않은 인쇄공이 갤리형 활자를 가져와 섞어서 활자 견본책을 만든 1500년대부터 업계의 표준 더미 텍스트가 되었습니다. 5세기 동안 살아남았을 뿐만 아니라 전자 조판으로의 도약에도 불구하고 본질적으로 변함없이 유지되었습니다. Lorem Ipsum 구절이 포함된 Letraset 시트가 출시된 1960년대에 대중화되었고, 최근에는 Aldus PageMaker와 같은 데스크톱 출판 소프트웨어에 Lorem Ipsum 버전이 포함되면서 대중화되었습니다.
          """
    , isExpanded: false, isRead: true),
        FAQ(id: 4, question: "Q. 로그인은 되어 있찌만 비밀번호를 모르겠어요.", date: "2024. 07. 15", answer: """
          Lorem Ipsum은 단순히 인쇄 및 조판 산업의 더미 텍스트입니다. Lorem Ipsum은 알려지지 않은 인쇄공이 갤리형 활자를 가져와 섞어서 활자 견본책을 만든 1500년대부터 업계의 표준 더미 텍스트가 되었습니다. 5세기 동안 살아남았을 뿐만 아니라 전자 조판으로의 도약에도 불구하고 본질적으로 변함없이 유지되었습니다. Lorem Ipsum 구절이 포함된 Letraset 시트가 출시된 1960년대에 대중화되었고, 최근에는 Aldus PageMaker와 같은 데스크톱 출판 소프트웨어에 Lorem Ipsum 버전이 포함되면서 대중화되었습니다.
          """
    , isExpanded: false, isRead: true),
        FAQ(id: 5, question: "Q. 비밀번호 변경은 어떻게 하나요?", date: "2024. 07. 15", answer: """
          Lorem Ipsum은 단순히 인쇄 및 조판 산업의 더미 텍스트입니다. Lorem Ipsum은 알려지지 않은 인쇄공이 갤리형 활자를 가져와 섞어서 활자 견본책을 만든 1500년대부터 업계의 표준 더미 텍스트가 되었습니다. 5세기 동안 살아남았을 뿐만 아니라 전자 조판으로의 도약에도 불구하고 본질적으로 변함없이 유지되었습니다. Lorem Ipsum 구절이 포함된 Letraset 시트가 출시된 1960년대에 대중화되었고, 최근에는 Aldus PageMaker와 같은 데스크톱 출판 소프트웨어에 Lorem Ipsum 버전이 포함되면서 대중화되었습니다.
          """
    , isExpanded: false, isRead: true),
        FAQ(id: 6, question: "Q. 친구초대 적립금 하루 제한이 있나요?", date: "2024. 07. 15", answer: """
          Lorem Ipsum은 단순히 인쇄 및 조판 산업의 더미 텍스트입니다. Lorem Ipsum은 알려지지 않은 인쇄공이 갤리형 활자를 가져와 섞어서 활자 견본책을 만든 1500년대부터 업계의 표준 더미 텍스트가 되었습니다. 5세기 동안 살아남았을 뿐만 아니라 전자 조판으로의 도약에도 불구하고 본질적으로 변함없이 유지되었습니다. Lorem Ipsum 구절이 포함된 Letraset 시트가 출시된 1960년대에 대중화되었고, 최근에는 Aldus PageMaker와 같은 데스크톱 출판 소프트웨어에 Lorem Ipsum 버전이 포함되면서 대중화되었습니다.
          """
    , isExpanded: false, isRead: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableView()
    }
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "자주 묻는 질문"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    

    private func setUpTableView(){
        tableView.register(AnnouncementHeaderView.self, forHeaderFooterViewReuseIdentifier: AnnouncementHeaderView.identifier)
        tableView.register(AnnouncementTableViewCell.self, forCellReuseIdentifier: AnnouncementTableViewCell.identifier)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return faqs.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqs[section].isExpanded ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnnouncementTableViewCell.identifier, for: indexPath) as? AnnouncementTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(message: faqs[indexPath.section].answer)
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: AnnouncementHeaderView.identifier) as! AnnouncementHeaderView
        headerView.configure(announcement: nil, faq: faqs[section])
        headerView.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:)))
        headerView.addGestureRecognizer(tapGesture)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 89
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.colord5d5d5
        separatorView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1)
        
        return separatorView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func headerTapped(_ sender: UITapGestureRecognizer) {
        if let headerView = sender.view as? AnnouncementHeaderView {
            if let id = headerView.id{
                expandCollapseMessage(id: id)
            }
        }
    }
}

extension FAQTableViewController: AnnouncementHeaderViewDelegate {
    func expandCollapseMessage(id: Int) {
        faqs[id].isExpanded.toggle()
        if faqs[id].isExpanded {
            tableView.insertRows(at: [IndexPath(row: 0, section: id)], with: .none)
            

        } else {
            tableView.deleteRows(at: [IndexPath(row: 0, section: id)], with: .none)
        }
    }
}

