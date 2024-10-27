//
//  Date+.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

extension Date {
    /// 현재 날짜를 "yyyy.MM" 형태로 반환하는 메서드
    func yearMonthString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM"
        return dateFormatter.string(from: self)
    }
    
    func toYYMMDDString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        return dateFormatter.string(from: self)
    }
}
