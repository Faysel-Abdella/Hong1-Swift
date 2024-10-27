//
//  UnitFormatter.swift
//  hong1
//
//  Created by Yohannes Haile on 10/24/24.
//
import Foundation
import DGCharts

// Create your custom formatter by implementing the AxisValueFormatter protocol
class UnitFormatter: AxisValueFormatter {
    let unit: String
    
    // You can pass in the unit you want, such as "kg", "m", "L", etc.
    init(unit: String) {
        self.unit = unit
    }
    
    // This method gets called for each x-axis label to format the value
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return "\(Int(value)) \(unit)"  // Append the unit to the value
    }
}
