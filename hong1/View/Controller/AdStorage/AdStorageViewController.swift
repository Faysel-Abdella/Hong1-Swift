//
//  광고보관함ViewController.swift | AdStorageViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/17/24.
//

import UIKit

class AdStorageViewController: UIViewController {
    
    let noticeView = NoticeBannerView()
    let segmentedControl = CustomSegmentedControl(withTitles: ["KEEP 광고", "스크랩 광고"])
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TipsTableViewCell.self, forCellReuseIdentifier: TipsTableViewCell.identifier)
        table.register(KeptAdTableViewCell.self, forCellReuseIdentifier: KeptAdTableViewCell.identifier)
        table.register(ScrapAdTableViewHeader.self, forHeaderFooterViewReuseIdentifier: ScrapAdTableViewHeader.identifier)
        table.register(ScrapAdTableViewCell.self, forCellReuseIdentifier: ScrapAdTableViewCell.identifier)
        table.separatorStyle = .none
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpViews()
    }
    
    private func setUpViews(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(noticeView)
        segmentedControl.selectedTextColor = UIColor.color353b48
        segmentedControl.textColor = UIColor.color9b9b9b
        segmentedControl.tintColor = UIColor.colorfa4e29
        segmentedControl.addTarget(self, action: #selector(segmentControlValueChanged), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        view.addSubview(tableView)
        self.applyConstraints()
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func applyConstraints() {
        noticeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(21)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-21)
            make.height.equalTo(88)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(noticeView.snp.bottom).offset(22)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(35)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension AdStorageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        switch segmentedControl.selectedIndex {
            case 0:
                return 2
            case 1:
                return 1
            default:
                return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            switch (segmentedControl.selectedIndex){
            case 0:
                return 1
            case 1:
                return 5
            default:
                return 0
            }
            
        case 1:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            switch (segmentedControl.selectedIndex){
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TipsTableViewCell.identifier, for: indexPath) as? TipsTableViewCell else {
                    return UITableViewCell()
                }
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ScrapAdTableViewCell.identifier, for: indexPath) as?
                        ScrapAdTableViewCell else{
                    return UITableViewCell()
                }
                
                cell.configure(adTitle: "서프라이즈 짱 - 술자리에서 내가 짱이···", scrapDate: "스크랩 날짜 2024.07.15 12:46")
                return cell
            default:
                // Return nothing
                let cell = UITableViewCell()
                return cell
            }
            
        case 1:
            switch segmentedControl.selectedIndex {
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: KeptAdTableViewCell.identifier, for: indexPath) as? KeptAdTableViewCell else {
                        return UITableViewCell()
                    }
                    
                    cell.configure(adTitle: "서프라이즈 짱 - 술자리에서 내가 짱이···", expiryDate: "남은기간 3일", archiveDate: "보관 날짜 2024.07.15 12:46")
            
                    return cell
            case 1:
                    return UITableViewCell()
            default:
                    return UITableViewCell()
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch segmentedControl.selectedIndex{
        case 0:
            switch indexPath.section {
                case 0:
                    return 96.2
                case 1:
                    return 50
                default:
                    return 0
                }
        case 1:
            return 50
        default:
            return 0
        }
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            switch segmentedControl.selectedIndex{
            case 0:
                return "KEEP해둔 광고"
            case 1:
                return nil
            default:
                return nil
            }
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            switch segmentedControl.selectedIndex{
                case 0:
                return nil
                case 1:
                    guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ScrapAdTableViewHeader.identifier) as? ScrapAdTableViewHeader else {
                        return nil
                    }
                    return headerView
                default:
                    return nil
                }
        case 1:
           return nil
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            switch segmentedControl.selectedIndex{
            case 0:
                return 0
            case 1:
                return 74
            default:
                return 0
            }
        case 1:
            switch segmentedControl.selectedIndex{
            case 0:
                return 74
            case 1:
                return 0
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section{
        case 0:
            switch segmentedControl.selectedIndex{
            case 0:
                let separatorView = UIView()
                separatorView.backgroundColor = UIColor.colorf2f2f2
                separatorView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1)
                
                return separatorView
            case 1:
                return nil
            default:
                return nil
            }
        case 1:
            return nil
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section{
        case 0:
            switch segmentedControl.selectedIndex{
            case 0:
                return 11
            case 1:
                return 0
            default:
                return 0
            }
        case 1:
            return 0
        default:
            return 0
        }
    }
    
}


extension AdStorageViewController {
    
    @objc func segmentControlValueChanged() {
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}
