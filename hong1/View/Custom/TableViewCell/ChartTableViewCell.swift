//
//  ChartTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/24/24.
//

import UIKit

class ChartTableViewCell: UITableViewCell {

    static let identifier = "ChartTableViewCell"
    
    private let segmentedControl = CustomSegmentedControl(withTitles: ["하루 광고", "지역별 광고", "성별 광고", "연령대별"])
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(DailyAdChartTableViewCell.self, forCellReuseIdentifier: DailyAdChartTableViewCell.identifier)
        table.register(LocalAdsChartTableViewCell.self, forCellReuseIdentifier: LocalAdsChartTableViewCell.identifier)
        table.register(GenderAdsChartTableViewCell.self, forCellReuseIdentifier: GenderAdsChartTableViewCell.identifier)
        table.register(AgeGroupChartTableViewCell.self, forCellReuseIdentifier: AgeGroupChartTableViewCell.identifier)
        return table
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpTableView()
        setUpViews()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpViews(){
        segmentedControl.selectedTextColor = UIColor.colorfa4e29
        segmentedControl.textColor = UIColor.color9b9b9b
        segmentedControl.tintColor = UIColor.colorfa4e29
        segmentedControl.addTarget(self, action: #selector(segmentControlValueChanged), for: .valueChanged)
        contentView.addSubview(segmentedControl)
        contentView.addSubview(tableView)
    }
    
    
    private func applyConstraints(){
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 20.3),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 35),
            
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    @objc private func segmentControlValueChanged(){
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
    }
}

extension ChartTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segmentedControl.selectedIndex {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyAdChartTableViewCell.identifier, for: indexPath) as? DailyAdChartTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 1:
            guard let cell =  tableView.dequeueReusableCell(withIdentifier: LocalAdsChartTableViewCell.identifier, for: indexPath) as? LocalAdsChartTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GenderAdsChartTableViewCell.identifier, for: indexPath) as? GenderAdsChartTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AgeGroupChartTableViewCell.identifier, for: indexPath) as? AgeGroupChartTableViewCell else {
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 456.1
    }
    
    
}
