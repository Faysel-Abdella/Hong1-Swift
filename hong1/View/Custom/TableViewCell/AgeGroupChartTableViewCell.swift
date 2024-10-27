//
//  AgeGroupChartTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/25/24.
//

import UIKit
import DGCharts

class AgeGroupChartTableViewCell: UITableViewCell, ChartViewDelegate {

    static let identifier = "AgeGroupChartTableViewCell"
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var chartView: BarChartView = {
        let chartView = BarChartView()
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .ptRegular12Font ?? .systemFont(ofSize: 12)
        chartView.xAxis.labelTextColor = .color666666
        chartView.xAxis.axisLineColor = .colord5d5d5
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.granularityEnabled = false
        chartView.barData?.barWidth = 0.40
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.axisLineColor = .colord5d5d5
        chartView.leftAxis.drawGridLinesEnabled = true
        chartView.leftAxis.gridColor = .colord5d5d5
        chartView.leftAxis.labelFont = .ptRegular11Font ?? .systemFont(ofSize: 11)
        chartView.leftAxis.labelTextColor = .color666666
        chartView.leftAxis.granularity = 1000
        chartView.leftAxis.axisMinimum = 0
        chartView.leftAxis.axisMaximum = 5000
        chartView.animate(xAxisDuration: 2.5)
        return chartView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpChartView()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpViews(){
        let text = "50대 시청률이 54.5%입니다."
        let attributedText = createAttributedString(from: text)
        descriptionLabel.attributedText = attributedText
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(chartView)
    }
    
    private func setUpChartView() {
        let entries: [BarChartDataEntry] = [
            BarChartDataEntry(x: 0, y: 200),
            BarChartDataEntry(x: 1, y: 300),
            BarChartDataEntry(x: 2, y: 900),
            BarChartDataEntry(x: 3, y: 2100),
            BarChartDataEntry(x: 4, y: 4500)
        ]


        let dataSet = BarChartDataSet(entries: entries)
        dataSet.colors = [UIColor.colorffb7a8]
        
        let data = BarChartData(dataSet: dataSet)
        
        chartView.delegate = self
        chartView.data = data
        
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["10대", "20대", "30대", "40대", "50대"])
        
        
        chartView.notifyDataSetChanged()
    }
    
    
    private func applyConstraints(){
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 21),
            
            chartView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25.5),
            chartView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23),
            chartView.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: -23),
            chartView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -62.1)
        ])
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
