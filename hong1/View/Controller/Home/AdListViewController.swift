//
//  AdListViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/23/24.
//

import UIKit

class AdListViewController: UIViewController {
    
    private let segmentedControl = CustomSegmentedControl(withTitles: ["꿀잼", "콘텐츠", "배너"])
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(AdListStatTableViewCell.self, forCellReuseIdentifier: AdListStatTableViewCell.identifier)
        table.register(AdListTableViewCell.self, forCellReuseIdentifier: AdListTableViewCell.identifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
        setUpTableView()
        setUpViews()
        applyConstraints()
    }
    
    
    private func setUpNavigationController(){
        self.title = "광고 목록"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        
        segmentedControl.selectedTextColor = UIColor.color353b48
        segmentedControl.textColor = UIColor.color9b9b9b
        segmentedControl.tintColor = UIColor.colorfa4e29
        segmentedControl.addTarget(self, action: #selector(segmentControlValueChanged), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        view.addSubview(tableView)
    }
    
    private func applyConstraints(){
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 37.3),
            segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 35),
            
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    
    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func segmentControlValueChanged() {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}

extension AdListViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return 1
        case 1:
            return 10
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AdListStatTableViewCell.identifier, for: indexPath) as? AdListStatTableViewCell else{
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AdListTableViewCell.identifier, for: indexPath) as? AdListTableViewCell else{
                return UITableViewCell()
            }
            cell.configure(adName: "리앤쿡5", date: "2021. 11. 08", numberOfAds: "134561 / 393862")
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 127.8
        case 1:
            return 130.2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let separatorView = UIView()
            separatorView.backgroundColor = UIColor.colorf2f2f2
            separatorView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 11)
            
            return separatorView
        case 1:
            return nil
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 11
        case 1:
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let statViewController = StatisticalStatusViewController()
        navigationController?.pushViewController(statViewController, animated: true)
    }
}
