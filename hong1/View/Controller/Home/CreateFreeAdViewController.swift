//
//  CreateFreeAdViewController.swift
//  hong1
//
//  Created by NAHØM on 26/10/2024.
//

import UIKit

class CreateFreeAdViewController: UIViewController {
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
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        setupBannerView()
    }
    
    private func setupNavigationBar(){
        self.title = "광고만들기(무료)"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(didTapBack))
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
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

extension CreateFreeAdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            cell.textLabel?.text = "제작할 광고 종류를 \n선택해 주세요."
            cell.textLabel?.numberOfLines = 2
            cell.textLabel?.font = .systemFont(ofSize: 21, weight: .black)
            cell.detailTextLabel?.text = "스스로 올리는 셀프 벌 광고는 모두 타켓 광고입니다."
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CreateAdListTableViewCell", for: indexPath) as? CreateAdListTableViewCell else {
                return UITableViewCell()
            }
            switch indexPath.row {
                case 0:
                    cell.iconImageView.image = UIImage(named: "mystore")
                    cell.titleLabel.text = "가게 광고"
                    cell.subtitleLabel.text = "내 가게 내가 찍고, 내가 홍보할 수 있어요"
                case 1:
                    cell.iconImageView.image = UIImage(named: "product")
                    cell.titleLabel.text = "제품 광고"
                    cell.subtitleLabel.text = "수 공예품 및 다양한 판매 상품에 대한 광고를 올려보세요"
                case 2:
                    cell.iconImageView.image = UIImage(named: "sales")
                    cell.titleLabel.text = "영업 광고"
                    cell.subtitleLabel.text = "영업 내용과 명함을 함께 올려 신뢰있는 광고를 올려보세요"
                default:
                    break
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
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
        if indexPath.section != 2 { return nil }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let popupVC = WarningPopUpViewController()
        popupVC.nav = self.navigationController
        popupVC.modalPresentationStyle = .overCurrentContext
        popupVC.modalTransitionStyle = .crossDissolve
        present(popupVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
