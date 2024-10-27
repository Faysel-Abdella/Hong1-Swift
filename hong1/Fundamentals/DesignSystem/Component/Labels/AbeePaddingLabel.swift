//
//  AbeePaddingLabel.swift
//  ABEE
//
//  Created by 엄지호 on 10/14/24.
//

import UIKit

final class AbeePaddingLabel: UILabel {
    private var padding = UIEdgeInsets(top: 6, left: 9, bottom: 6, right: 9)

    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
}
