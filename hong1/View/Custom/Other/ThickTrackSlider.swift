//
//  ThickTrackSlider.swift
//  hong1
//
//  Created by Yohannes Haile on 10/18/24.
//

import UIKit

class ThickTrackSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
       
        let customHeight: CGFloat = 15.0  
        var trackBounds = super.trackRect(forBounds: bounds)
        trackBounds.size.height = customHeight
        return trackBounds
    }
}
