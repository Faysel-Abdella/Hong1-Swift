//
//  GenderAdsChartTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/25/24.
//

import UIKit
import DGCharts

class GenderAdsChartTableViewCell: UITableViewCell {
    
    static let identifier = "GenderAdsChartTableViewCell"
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var chartView: PieChartView = {
        let chartView = PieChartView()
        chartView.legend.enabled = true
        chartView.legend.horizontalAlignment = .right
        chartView.legend.verticalAlignment = .bottom
        chartView.legend.orientation = .vertical
        chartView.legend.font = .ptRegular11Font ?? .systemFont(ofSize: 10)
        chartView.legend.textColor = .color242424
        chartView.holeRadiusPercent = 0.4
        chartView.transparentCircleRadiusPercent = 0.4
        chartView.animate(xAxisDuration: 2.5)
        return chartView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstraints()
        setUpChartView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpViews(){
        let text = "남성 29.8% / 여성 67.5%소진 되었습니다."
        let attributedText = createAttributedString(from: text)
        descriptionLabel.attributedText = attributedText
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(chartView)
    }
    
    private func applyConstraints(){
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 21),
            
            chartView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24.1),
            chartView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            chartView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -52)
        ])
    }
    
    private func setUpChartView(){
        let entry1 = PieChartDataEntry(value: 67.5, label: "여성")
        let entry2 = PieChartDataEntry(value: 29.8, label: "남성")
       
        
        let dataSet = PieChartDataSet(entries: [entry1, entry2])
        dataSet.valueFormatter = PercentValueFormatter()
        
        // Set colors
        dataSet.colors = [UIColor.color9eb5fb, UIColor.colorfb8dbc]
        
        let data = PieChartData(dataSet: dataSet)
        chartView.data = data
        
    }
    
    
    func createAttributedString(from text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)

        let numberAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.ptMedium18Font ?? .systemFont(ofSize: 18),
            .foregroundColor: UIColor.color242424
        ]

        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.ptMedium18Font ?? .systemFont(ofSize: 18),
            .foregroundColor: UIColor.color8e8e8e
        ]
        

        attributedString.addAttributes(textAttributes, range: NSRange(location: 0, length: text.count))

        let numberPattern = "\\d+"
        let regex = try! NSRegularExpression(pattern: numberPattern)
        let matches = regex.matches(in: text, range: NSRange(location: 0, length: text.utf16.count))

        for match in matches {
            attributedString.addAttributes(numberAttributes, range: match.range)
        }

        return attributedString
    }
    
}
