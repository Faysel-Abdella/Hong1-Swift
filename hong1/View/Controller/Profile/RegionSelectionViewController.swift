//
//  RegionSelectionViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit
import SnapKit

class RegionSelectionViewController: UIViewController {
    
    let regions: [[String: String]] = [
        ["전국": "전국"],
        ["서울시": "종로구"],
        ["인천시": "중구"],
        ["대구시": "용산구"],
        ["대전시": "성동구"],
        ["경기도": "광진구"],
        ["충청도": "동대문구"],
    ]
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(RegionTableHeaderView.self, forHeaderFooterViewReuseIdentifier: RegionTableHeaderView.identifier)
        table.register(RegionTableViewCell.self, forCellReuseIdentifier: RegionTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpViews()
        applyConstraints()
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpViews(){
        view.addSubview(tableView)
    }
    
    private func applyConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension RegionSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegionTableViewCell.identifier, for: indexPath) as? RegionTableViewCell else {
            return UITableViewCell()
        }
        
        let dict = regions[indexPath.row]
            
        if let (key, value) = dict.first {
            let isSelected = key == "서울시" ? false : true
            cell.configure(city: key, district: value, isSelected: isSelected)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 53
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RegionTableHeaderView.identifier) as? RegionTableHeaderView else {
            return nil
        }
        headerView.delegate = self
        return headerView
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 87.5
    }
}

extension RegionSelectionViewController: RegionTableHeaderViewDelegate {
    func collapseModal() {
        dismiss(animated: true)
    }
    
    
}
