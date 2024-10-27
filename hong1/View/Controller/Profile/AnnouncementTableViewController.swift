//
//  AnnoucementTableViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/20/24.
//

import UIKit

struct Annoucement {
    let id: Int
    let headline: String
    let date: String
    let message: String
    var isExpanded: Bool
    let isRead: Bool
}


class AnnouncementTableViewController: UITableViewController {
    
    var announcements: [Annoucement] = [
        Annoucement(id: 0, headline: "[긴급점검] 벌광고 서비스 점검 안내", date: "2024. 07. 15", message: """
                    안녕하세요. 아비입니다.
                    
                    · 점검 일시 : 2023년 12월 19(화) 00:00 ~ 03:00
                    · 점검 내용 : 벌 광고 안정화
                    · 중단 서비스 : 벌 광고

                    서비스 점검으로 벌 광고 서비스가 제한됩니다.
                    이 점 양해 부탁드립니다.
                    감사합니다.
                    """, isExpanded: false, isRead: false),
        Annoucement(id: 1, headline: "[지급 완료]아비코인 최다 추첨자 이벤트 당점자 안내", date: "2024. 07. 15", message: """
                    안녕하세요. 아비입니다.
                    
                    · 점검 일시 : 2023년 12월 19(화) 00:00 ~ 03:00
                    · 점검 내용 : 벌 광고 안정화
                    · 중단 서비스 : 벌 광고

                    서비스 점검으로 벌 광고 서비스가 제한됩니다.
                    이 점 양해 부탁드립니다.
                    감사합니다.
                    """, isExpanded: false, isRead: false),
        Annoucement(id: 2, headline: "[공지] 친구 초대 오류 관련 안내 벌광고 서비스 점검 안내", date: "2024. 07. 15", message: """
                    안녕하세요. 아비입니다.
                    
                    · 점검 일시 : 2023년 12월 19(화) 00:00 ~ 03:00
                    · 점검 내용 : 벌 광고 안정화
                    · 중단 서비스 : 벌 광고

                    서비스 점검으로 벌 광고 서비스가 제한됩니다.
                    이 점 양해 부탁드립니다.
                    감사합니다.
                    """, isExpanded: false, isRead: true),
        Annoucement(id: 3, headline: "[공지] 기프티콘 포인트 사용 수수료 조정 안내", date: "2024. 07. 15", message: """
                    안녕하세요. 아비입니다.
                    
                    · 점검 일시 : 2023년 12월 19(화) 00:00 ~ 03:00
                    · 점검 내용 : 벌 광고 안정화
                    · 중단 서비스 : 벌 광고

                    서비스 점검으로 벌 광고 서비스가 제한됩니다.
                    이 점 양해 부탁드립니다.
                    감사합니다.
                    """, isExpanded: false, isRead: true),
        Annoucement(id: 4, headline: "[공지] 광고 적립 오류 관련 안내", date: "2024. 07. 15", message: """
                    안녕하세요. 아비입니다.
                    
                    · 점검 일시 : 2023년 12월 19(화) 00:00 ~ 03:00
                    · 점검 내용 : 벌 광고 안정화
                    · 중단 서비스 : 벌 광고

                    서비스 점검으로 벌 광고 서비스가 제한됩니다.
                    이 점 양해 부탁드립니다.
                    감사합니다.
                    """, isExpanded: false, isRead: true)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableView()
    }
    
    private func setUpNavigationBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "공지사항"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    

    private func setUpTableView(){
        tableView.register(AnnouncementHeaderView.self, forHeaderFooterViewReuseIdentifier: AnnouncementHeaderView.identifier)
        tableView.register(AnnouncementTableViewCell.self, forCellReuseIdentifier: AnnouncementTableViewCell.identifier)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return announcements.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return announcements[section].isExpanded ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnnouncementTableViewCell.identifier, for: indexPath) as? AnnouncementTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(message: announcements[indexPath.section].message)
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: AnnouncementHeaderView.identifier) as! AnnouncementHeaderView
        headerView.configure(announcement: announcements[section], faq: nil)
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

extension AnnouncementTableViewController: AnnouncementHeaderViewDelegate {
    func expandCollapseMessage(id: Int) {
        announcements[id].isExpanded.toggle()
        if announcements[id].isExpanded {
            tableView.insertRows(at: [IndexPath(row: 0, section: id)], with: .none)
            

        } else {
            tableView.deleteRows(at: [IndexPath(row: 0, section: id)], with: .none)
        }
    }
}
