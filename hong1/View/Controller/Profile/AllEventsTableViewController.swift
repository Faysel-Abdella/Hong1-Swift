//
//  AllEventsTableViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/21/24.
//

import UIKit

struct Event {
    let name: String
    let from: String
    let to: String
}



class AllEventsTableViewController: UITableViewController {
    
    let events: [Event] = [
        Event(name: "꿀잼 사업 설명회", from: "2024. 07. 05", to: "2024. 07.20"),
        Event(name: "알람 신청하면 포인트+100", from: "2024. 07. 05", to: "2024. 07.20"),
        Event(name: "꿀잼 인스트그램 오픈 기념 팔로우 이벤트", from: "2024. 07. 05", to: "2024. 07.20"),
        Event(name: "알람 신청하면 포인트+100", from: "2024. 07. 05", to: "2024. 07.20"),
        Event(name: "꿀잼 사업 설명회", from: "2024. 07. 05", to: "2024. 07.20"),
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableView()
    }
    
    private func setUpNavigationBar(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setUpTableView(){
        tableView.separatorStyle = .none
        tableView.register(EventTableHeaderView.self, forHeaderFooterViewReuseIdentifier: EventTableHeaderView.identifier)
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
    }
    

    
    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath) as? EventTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(image: "eventbanner", eventName: events[indexPath.row].name, fromDate: events[indexPath.row].from, toDate: events[indexPath.row].to)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: EventTableHeaderView.identifier) as? EventTableHeaderView else {
            return UIView()
        }
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 66
    }
}
