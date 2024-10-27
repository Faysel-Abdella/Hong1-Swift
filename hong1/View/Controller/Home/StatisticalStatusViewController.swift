//
//  StatisticalStatusViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/24/24.
//

import UIKit

class StatisticalStatusViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(StatHeaderView.self, forHeaderFooterViewReuseIdentifier: StatHeaderView.identifier)
        table.register(BasicStatTableViewCell.self, forCellReuseIdentifier: BasicStatTableViewCell.identifier)
        table.register(AdConsumptionRateStatTableViewCell.self, forCellReuseIdentifier: AdConsumptionRateStatTableViewCell.identifier)
        table.register(DemographyStatTableViewCell.self, forCellReuseIdentifier: DemographyStatTableViewCell.identifier)
        table.register(ChartTableViewCell.self, forCellReuseIdentifier: ChartTableViewCell.identifier)
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
        setUpViews()
        setUpTableView()
        applyConstraints()
        
    }

    private func setUpNavigationController(){
        self.title = "통계 현황"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
    
    private func applyConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
}


extension StatisticalStatusViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: BasicStatTableViewCell.identifier, for: indexPath) as? BasicStatTableViewCell else {
                    return UITableViewCell()
                }
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: AdConsumptionRateStatTableViewCell.identifier, for: indexPath) as? AdConsumptionRateStatTableViewCell else {
                    return UITableViewCell()
                }
                return cell
                
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DemographyStatTableViewCell.identifier, for: indexPath) as? DemographyStatTableViewCell else {
                    return UITableViewCell()
                }
                return cell
            default:
                return UITableViewCell()
            }
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChartTableViewCell.identifier, for: indexPath) as? ChartTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return 192.3
            case 1, 2:
                return 95.3
            default:
                return 0
            }
        case 1:
            return 437.7
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: StatHeaderView.identifier) as? StatHeaderView else {
                return UIView()
            }
            return headerView
        case 1:
            return nil
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 75
        case 1:
            return 0
        default:
            return 0
        }
    }
}
    

