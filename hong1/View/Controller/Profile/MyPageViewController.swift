//
//  MyPageViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/18/24.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController {
    
    let notification: [[String: Bool]] = [
        ["벌광고 Bee 모으기": true],
        ["공지 및 이벤트 당첨 알림": false]
    ]
    
    let account: [[String: String]] = [
        ["information": "내 정보"],
        ["password": "비밀번호 변경"],
        ["secession": "회원 탈퇴"],
        ["advertisement": "광고주 페이지"]
    ]
    
    let extra: [[String: String]] = [
        ["notification":"공지사항"],
        ["event": "이벤트"],
        ["question": "자주 묻는 질문"],
        ["11": "1:1 문의"],
        ["alliance": "제휴 및 광고문의"]
    ]
    
    let about: [[String: String?]] = [
        ["ABEE 홈페이지": "www. abee.co.kr"],
        ["서비스 이용약관": nil],
        ["개인정보 처리방침": nil],
        ["ABEE 사용설명서": nil]
    ]
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.register(NotificationSettingTableViewCell.self, forCellReuseIdentifier: NotificationSettingTableViewCell.identifier)
        table.register(SliderSettingTableViewCell.self, forCellReuseIdentifier: SliderSettingTableViewCell.identifier)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(AdTableViewCell.self, forCellReuseIdentifier: AdTableViewCell.identifier)
        table.register(AboutTableViewCell.self, forCellReuseIdentifier: AboutTableViewCell.identifier)
        
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

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 4
        case 3:
            return 6
        case 4:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 166
        case 1:
            switch indexPath.row {
            case 0, 1:
                return 60.85
            case 2:
                return 99.8
            default:
                return 0
            }
            
        case 2:
            return 62.65
        case 3:
            switch indexPath.row {
                case 0, 1, 2, 3, 4:
                    return 62.65
                case 5:
                    return 166
                default:
                    return 0
                }
            
        case 4:
            return 42
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as? AdTableViewCell else{
                return UITableViewCell()
            }
            cell.configure(image: "simplebanner")
            return cell
            
        case 1:
            
            
            switch indexPath.row{
            case 0, 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationSettingTableViewCell.identifier, for: indexPath) as? NotificationSettingTableViewCell else {
                    return UITableViewCell()
                }
                let dict = notification[indexPath.row]
                
                if let (key, value) = dict.first {
                    cell.configure(settingName: key, isSwitchedOn: value)
                    cell.switchValueChanged = { isOn in
                        cell.configure(settingName: key, isSwitchedOn: isOn)
                    }
                }
                
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SliderSettingTableViewCell.identifier, for: indexPath) as? SliderSettingTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.configure(settingName: "폰트 크기 설정", sliderValue: 12)
                cell.onSliderValueChanged = { newValue in
                    cell.configure(settingName:  "폰트 크기 설정", sliderValue: newValue)
                }
                
                return cell
            default:
                return UITableViewCell()
            }
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            
            let dict = account[indexPath.row]
            
            if let (key, value) = dict.first {
                cell.configure(iconName: key, settingName: value)
            }
            
            return cell
        case 3:
            switch indexPath.row{
            case 0, 1, 2, 3, 4:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
                    return UITableViewCell()
                }
                let dict = extra[indexPath.row]
                
                if let (key, value) = dict.first {
                    cell.configure(iconName: key, settingName: value)
                }
                
                return cell
            case 5:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as? AdTableViewCell else{
                    return UITableViewCell()
                }
                cell.configure(image: "simplebanner")
                
                return cell
            default:
                return UITableViewCell()
            }
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AboutTableViewCell.identifier, for: indexPath) as? AboutTableViewCell else {
                return UITableViewCell()
            }
            
            let dict = about[indexPath.row]
            
            if let (key, value) = dict.first {
                cell.configure(info: key, more: value)
            }
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return nil
        case 1:
            return "알림 설정"
        case 2:
            return "계정"
        case 3:
            return "기타"
        case 4:
            return "최신버전 2.4.16"
        default:
            return nil
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        let label = UILabel()
        label.text = self.tableView(tableView, titleForHeaderInSection: section)
        label.textColor = UIColor.color2e2e2e
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        let separatorLine = UIView()
        separatorLine.backgroundColor = UIColor.colorb5b5b5
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        
        
        headerView.addSubview(label)
        headerView.addSubview(separatorLine)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 28.5),
            label.heightAnchor.constraint(equalToConstant: 25),
            
            separatorLine.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            separatorLine.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 0),
            separatorLine.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: 0),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        switch section{
            case 0:
                return 0
            case 1, 2, 3:
                return 71.5
            case 4:
                return 60
            default:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.colorf2f2f2
        separatorView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 11)
        
        return separatorView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 11.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section{
        case 0:
            print("Ad tap")
        case 1:
            print("Notification setting tap")
        case 2:
            switch indexPath.row{
            case 0:
                let myInfoViewController = MyInformationViewController()
                navigationController?.pushViewController(myInfoViewController, animated: true)
            case 1:
                print("Setting tap")
            case 2:
                let unsubscribeViewController = UnsubscribeViewController()
                navigationController?.pushViewController(unsubscribeViewController, animated: true)
            case 3:
                print("Setting tap")
            default:
                print("Default tap")
                
            }
        case 3:
            switch indexPath.row {
            case 0:
                let announcementViewController = AnnouncementTableViewController()
                navigationController?.pushViewController(announcementViewController, animated: true)
            case 1:
                let allEventsViewController = AllEventsTableViewController()
                navigationController?.pushViewController(allEventsViewController, animated: true)
            case 2:
                let faqViewController = FAQTableViewController()
                navigationController?.pushViewController(faqViewController, animated: true)
            case 3:
                let oneToOneViewController = OneToOneViewController()
                navigationController?.pushViewController(oneToOneViewController, animated: true)
            case 4:
                let partnerViewController = PartnershipInquiriesViewController()
                navigationController?.pushViewController(partnerViewController, animated: true)
            default:
                print("Default tap")
            }
        case 4:
            print("About tap")
        default:
           print("Default tap")
        }
    }
    
}
