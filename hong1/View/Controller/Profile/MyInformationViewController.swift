//
//  MyInformationViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/19/24.
//

import UIKit
import SnapKit

class MyInformationViewController: UIViewController {
    
    let information: [[String: String]] = [
        ["연결된 계정": "abeelove@naver.com"],
        ["이름": "홍길동"],
        ["성별": "여자"],
        ["생일": "1988.08.11"],
        ["지역": "인천광역시"],
        ["휴대번호": "010. 7815. 0126"],
        ["이메일": "abeelove@naver.com"]
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MyInformationTableViewCell.self, forCellReuseIdentifier: MyInformationTableViewCell.identifier)
        tableView.register(AdTableViewCell.self, forCellReuseIdentifier: AdTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpTableView()
        setUpViews()
        applyConstraints()
    }
    
    private func setUpNavigationBar(){
        self.title = "내 정보"
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
    
    private func applyConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    @objc private func didTapBack(){
        navigationController?.popViewController(animated: true)
    }
}

extension MyInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0, 1, 2, 3, 4, 5, 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyInformationTableViewCell.identifier, for: indexPath) as? MyInformationTableViewCell else{
                return UITableViewCell()
            }
            
            let dict = information[indexPath.row]
            if let (key, value) = dict.first  {
                cell.configure(information: key, value: value)
            }
            cell.delegate = self
            return cell
        case 7:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as? AdTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(image: "simplebanner")
            return cell
            
        default:
            print("Default")
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0, 1, 2, 3, 4, 5, 6:
            return 90.5
        case 7:
            return 166
        default:
            return 0
        }
        
    }
}


extension MyInformationViewController: MyInformationTableViewCellDelegate {
    func didTapEditLabel(_ cell: MyInformationTableViewCell) {
        // Find the index path if needed
        if tableView.indexPath(for: cell) != nil {
            // Present your modal view controller
            let regionSelectionVC = RegionSelectionViewController()

            if #available(iOS 15.0, *) {
                // Set modalPresentationStyle to .pageSheet or .formSheet
                regionSelectionVC.modalPresentationStyle = .pageSheet
                
                if let sheet = regionSelectionVC.sheetPresentationController {
                    sheet.detents = [.medium()]  // This makes it appear halfway
                    sheet.prefersGrabberVisible = true  // Optional: adds a small grabber at the top of the sheet
                }

                present(regionSelectionVC, animated: true, completion: nil)
            } else {
                // Fallback for earlier iOS versions
                regionSelectionVC.modalPresentationStyle = .formSheet
                present(regionSelectionVC, animated: true, completion: nil)
            }

        }
    }
}
