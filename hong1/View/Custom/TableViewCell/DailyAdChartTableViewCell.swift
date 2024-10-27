//
//  DailyAdChartTableViewCell.swift
//  hong1
//
//  Created by Yohannes Haile on 10/24/24.
//

import UIKit
import DGCharts

class DailyAdChartTableViewCell: UITableViewCell, ChartViewDelegate {

    static let identifier = "DailyAdChartTableViewCell"
    
    
    let demoValues = [ChartDataEntry(x: 01, y: 1600), ChartDataEntry(x: 02, y: 1500), ChartDataEntry(x: 03, y: 1570), ChartDataEntry(x: 04, y: 1650), ChartDataEntry(x: 05, y: 1530), ChartDataEntry(x: 06, y: 1600), ChartDataEntry(x: 07, y: 1550)]
    
    private let soldOutLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var chartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .clear
        chartView.rightAxis.enabled = false
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .ptRegular11Font ?? .systemFont(ofSize: 11)
        yAxis.labelTextColor = UIColor.color666666
        yAxis.axisMinimum = 0
        yAxis.axisMaximum = 2000
        yAxis.axisLineColor = .clear
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .ptRegular12Font ?? .systemFont(ofSize: 12)
        xAxis.labelTextColor = .color666666
        xAxis.labelPosition = .bottom
        xAxis.valueFormatter = UnitFormatter(unit: "일")
        xAxis.setLabelCount(7, force: true)
       

        chartView.animate(xAxisDuration: 2.5)
        chartView.xAxis.drawGridLinesEnabled = false
        return chartView
    }()
    
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.font = .ptRegular12Font
        label.textColor  = .color9b9b9b
        label.text = "8월"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        applyConstraints()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpChartView(){
        chartView.delegate = self
        chartView.backgroundColor = .white
        chartView.gridBackgroundColor = UIColor.colorfa4e29
        chartView.drawGridBackgroundEnabled = true
        chartView.chartDescription.enabled = false
    }
    
    private func setUpViews(){
        let text = "1680개 소진 되었습니다."
        let attributedText = createAttributedString(from: text)
        soldOutLabel.attributedText = attributedText
        contentView.addSubview(soldOutLabel)
        contentView.addSubview(chartView)
        contentView.addSubview(monthLabel)
    }
    
    private func applyConstraints(){
        soldOutLabel.translatesAutoresizingMaskIntoConstraints = false
        chartView.translatesAutoresizingMaskIntoConstraints = false
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            soldOutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 26.5),
            soldOutLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            soldOutLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            soldOutLabel.heightAnchor.constraint(equalToConstant: 21),
            
            chartView.topAnchor.constraint(equalTo: soldOutLabel.bottomAnchor, constant: 25.5),
            chartView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            chartView.heightAnchor.constraint(equalToConstant: 252),
            
            monthLabel.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 6),
            monthLabel.leadingAnchor.constraint(equalTo: centerXAnchor),
            monthLabel.widthAnchor.constraint(equalToConstant: 20),
            monthLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
    }

    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData(){
        let set = LineChartDataSet(entries: demoValues)
        
        set.drawCircleHoleEnabled = false
        set.drawCirclesEnabled = false
        set.mode = .linear
        set.lineWidth = 2
        set.setColor(UIColor.colorfa4e29)
        set.label = nil
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(false)
        

        let gradientColors = [UIColor.colorfa4e29.cgColor, UIColor.white.cgColor] as CFArray
        let colorLocations: [CGFloat] = [1.0, 0.0]


        if let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) {
            set.fill = LinearGradientFill(gradient: gradient, angle: 90.0)
            set.drawFilledEnabled = true
        }
        
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
