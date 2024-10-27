//
//  LocalAdsChartTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/24/24.
//

import UIKit
import DGCharts

class LocalAdsChartTableViewCell: UITableViewCell, ChartViewDelegate {

    static let identifier = "LocalAdsChartTableViewCell"
    
    private let soldOutLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var chartView: HorizontalBarChartView = {
        let chartView = HorizontalBarChartView()
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.labelFont = .ptRegular11Font ?? .systemFont(ofSize: 11)
        chartView.xAxis.labelTextColor = .color666666
        chartView.xAxis.axisLineColor = .colord5d5d5
        
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = true
        
        chartView.rightAxis.axisMinimum = 0
        chartView.rightAxis.axisMaximum = 5000
        chartView.rightAxis.granularity = 1000
        chartView.rightAxis.labelFont = .ptRegular12Font ?? .systemFont(ofSize: 12)
        chartView.rightAxis.labelTextColor = .color666666
        chartView.rightAxis.axisLineColor = .colord5d5d5
        chartView.rightAxis.gridColor = .colord5d5d5
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
        let text = "447개 소진 되었습니다."
        let attributedText = createAttributedString(from: text)
        soldOutLabel.attributedText = attributedText
        contentView.addSubview(soldOutLabel)
        contentView.addSubview(chartView)
    }
    private func applyConstraints(){
        soldOutLabel.translatesAutoresizingMaskIntoConstraints = false
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            soldOutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            soldOutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            soldOutLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            soldOutLabel.heightAnchor.constraint(equalToConstant: 21),
            
            chartView.topAnchor.constraint(equalTo: soldOutLabel.bottomAnchor, constant: 17.1),
            chartView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            chartView.heightAnchor.constraint(equalToConstant: 334.5)
        ])
    }
    
    private func setUpChartView() {
        let entries: [BarChartDataEntry] = [
            BarChartDataEntry(x: 0, y: 300),
            BarChartDataEntry(x: 1, y: 300),
            BarChartDataEntry(x: 2, y: 1000),
            BarChartDataEntry(x: 3, y: 1200),
            BarChartDataEntry(x: 4, y: 700),
            BarChartDataEntry(x: 5, y: 2060),
            BarChartDataEntry(x: 6, y: 900),
            BarChartDataEntry(x: 7, y: 870),
            BarChartDataEntry(x: 8, y: 990),
            BarChartDataEntry(x: 9, y: 1010),
            BarChartDataEntry(x: 10, y: 1210),
            BarChartDataEntry(x: 11, y: 1200),
            BarChartDataEntry(x: 12, y: 3050),
        ]


        let dataSet = BarChartDataSet(entries: entries)
        dataSet.colors = [UIColor.colorffb7a8]
        
        let data = BarChartData(dataSet: dataSet)
        data.barWidth = 0.35
        
        chartView.delegate = self
        chartView.data = data
        
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["서울", "인천", "대구", "대전", "경기", "충청", "전라", "경상", "제주", "부산", "광주", "울산", "강원"])

        chartView.setVisibleXRange(minXRange: 8.0, maxXRange: 8.0)
        chartView.zoom(scaleX: 1.1, scaleY: 1.0, x: 0, y: 0)
        
        chartView.notifyDataSetChanged()
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
