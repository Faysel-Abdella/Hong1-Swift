//
//  PercentValueFormatter.swift
//  hong1
//
//  Created by Yohannes Haile on 10/25/24.
//

import Foundation
import DGCharts

class PercentValueFormatter: ValueFormatter {
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return String(format: "%.1f%%", value) // Displaying value as percentage
    }
}
