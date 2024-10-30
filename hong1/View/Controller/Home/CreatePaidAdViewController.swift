//
//  CreatePaidAdViewController.swift
//  hong1
//
//  Created by NAHØM on 27/10/2024.
//

import UIKit

class CreatePaidAdViewController: CreateFreeAdViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "광고만들기(유료)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 1:
                return 1
            case 2:
                return 4
            default:
                return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
                case 3:
                    cell.iconImageView.image = UIImage(named: "party")
                    cell.titleLabel.text = "기타"
                    cell.subtitleLabel.text = "연예인 생일 광고, 특별한 행사 등 알리고 싶은 광고를 올려보세요"
                default:
                    break
            }
            return cell
        }
        
        return UITableViewCell()
    }
}
