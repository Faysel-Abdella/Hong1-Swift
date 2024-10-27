//
//  HomeViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/21/24.
//

import UIKit

struct Ad {
    let imageName: String
    let adTitle: String
    let address: String
    let likesCount: String
    let commentsCount: String
}

class AdvertiseViewController: UITableViewController {

    let ads: [Ad] = [
        Ad(imageName: "ad1", adTitle: "라쥬란에스틱 인기 타앰플 50% 할인 이벤트", address: "리쥬란에스틱  / 전지역", likesCount: "1,521", commentsCount: "856"),
        Ad(imageName: "ad2", adTitle: "나랑베이커리 오후 12시 따끈한 빵이 나와요", address: "나랑드베이커  / 전지역", likesCount: "1,002", commentsCount: "578"),
        Ad(imageName: "ad3", adTitle: "신규회원 선착순 500명 스페셜 쿠폰 증정이벤트", address: "ABD  / 전지역", likesCount: "955", commentsCount: "122")
        
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpNavigationBar()
        setUpTableView()
    }
    
    private func setUpNavigationBar(){
        self.title = "광고하기"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setUpTableView(){
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(AdvertiseTableViewCell.self, forCellReuseIdentifier: AdvertiseTableViewCell.identifier)
        tableView.register(PersonalizedAdHeaderView.self, forHeaderFooterViewReuseIdentifier: PersonalizedAdHeaderView.identifier)
        tableView.register(PersonalizedAdTableViewCell.self, forCellReuseIdentifier: PersonalizedAdTableViewCell.identifier)
        tableView.register(SeeMoreTableViewCell.self, forCellReuseIdentifier: SeeMoreTableViewCell.identifier)
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return ads.count + 1
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
           
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AdvertiseTableViewCell.identifier, for: indexPath) as? AdvertiseTableViewCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            return cell
        case 1:
            if indexPath.row < ads.count {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalizedAdTableViewCell.identifier, for: indexPath) as? PersonalizedAdTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(ad: ads[indexPath.row])
                return cell
            }else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SeeMoreTableViewCell.identifier, for: indexPath) as? SeeMoreTableViewCell else {
                    return UITableViewCell()
                }
                return cell
            }
        default:
            return UITableViewCell()
    }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 780
        case 1:
            return 91.2
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 141.5
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return nil
        case 1:
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: PersonalizedAdHeaderView.identifier) as? PersonalizedAdHeaderView else {
                return nil
            }
            return headerView
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 11
        case 1:
            return 0
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch section {
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
    }
    
    @objc private func didTapBack(){
//        navigationController?.popViewController(animated: true)
    }
}

extension AdvertiseViewController: AdvertiseTableViewCellDelegate {
    func navigateToCreateAd() {
        let createAdViewController = CreateAdViewController()
        navigationController?.pushViewController(createAdViewController, animated: true)
    }
    func navigateToAdList() {
        let adListViewController = AdListViewController()
        navigationController?.pushViewController(adListViewController, animated: true)
    }
}
