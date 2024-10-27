//
//  CreateAdViewController.swift
//  hong1
//
//  Created by NAHØM on 26/10/2024.
//

import UIKit

class CreateAdViewController: UIViewController  {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let adBannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.image = UIImage(named: "simplead")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        setupNavigationBar()
        setupTableView()
        setupBannerView()
    }
    
    
    private func setupNavigationBar(){
        self.title = "광고만들기"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(CreateAdHeaderTableViewCell.self, forCellReuseIdentifier: "CreateAdHeaderTableViewCell")
        tableView.register(CreateAdListTableViewCell.self, forCellReuseIdentifier: "CreateAdListTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupBannerView() {
        view.addSubview(adBannerImageView)
        
        NSLayoutConstraint.activate([
            adBannerImageView.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            adBannerImageView.heightAnchor.constraint(equalToConstant: 100),
            adBannerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            adBannerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension CreateAdViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 1:
                return 1
            case 2:
                return 3
            default:
                return 0
        }
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CreateAdHeaderTableViewCell", for: indexPath) as? CreateAdHeaderTableViewCell else {
                return UITableViewCell()
            }
            // Configure the CreateAdHeaderTableViewCell as needed
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CreateAdListTableViewCell", for: indexPath) as? CreateAdListTableViewCell else {
                return UITableViewCell()
            }
            switch indexPath.row {
                case 0:
                    cell.iconImageView.image = UIImage(named: "bee1")
                    cell.titleLabel.text = "일벌 (무료)"
                    cell.subtitleLabel.text = "한달에 한번 무료로 광고를! 내가 원하는 타켓에게 벌을 날려요"
                case 1:
                    cell.iconImageView.image = UIImage(named: "bee2")
                    cell.titleLabel.text = "여왕벌 (유료)"
                    cell.subtitleLabel.text = "사용자에게 맞는 맞춤 광고로 최우선으로 노출됩니다."
                case 2:
                    cell.iconImageView.image = UIImage(named: "bee3")
                    cell.titleLabel.text = "후원 광고"
                    cell.subtitleLabel.text = "자사 광고와 동시에 소상공인에게 광고를 후원하는 콜라보 광고"
                default:
                    break
            }
            return cell
        }
        
        return UITableViewCell() // Fallback in case no sections match
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 1:
                "광고만들기"
            case 2:
                "벌 광고 종류"
            default:
                ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}
