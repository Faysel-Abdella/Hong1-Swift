//
//  UILabel+.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

extension UILabel {
    // 출처: https://sujinnaljin.medium.com/swift-label의-line-height-설정-및-가운데-정렬-962f7c6e7512
    func configureTextWithLineHeight(
        text: String?,
        lineHeight: CGFloat,
        alignment: NSTextAlignment = .left,
        lineBreakMode: NSLineBreakMode = .byTruncatingTail
    ) {
        guard let text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.alignment = alignment
        paragraphStyle.lineBreakMode = lineBreakMode
        
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .baselineOffset: (lineHeight - font.lineHeight) / 4
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        
        attributedText = attributedString
    }
    
    /// 텍스트의 특정부분에 반전컬러를 적용
    func highlightedTextColor(
        text: String,
        highlightedText: String,
        hignlightedTextColor: UIColor = .colorfa4e29
    ) {
        let attributedString = NSMutableAttributedString(string: text)

        if let rangeOfNumber = text.range(of: highlightedText) {
            let nsRange = NSRange(rangeOfNumber, in: text)
            attributedString.addAttribute(.foregroundColor, value: hignlightedTextColor, range: nsRange)
        }

        attributedText = attributedString
    }
    
    /// 텍스트에 lineHeight와 특정 부분에 하이라이트 컬러를 적용하는 메서드
    func configureTextWithLineHeightAndHighlight(
        text: String,
        lineHeight: CGFloat,
        alignment: NSTextAlignment = .left,
        highlightedText: String,
        highlightedTextColor: UIColor = .colorfa4e29
    ) {
        // 1. ParagraphStyle 생성하여 lineHeight 및 alignment 설정
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        paragraphStyle.alignment = alignment
        paragraphStyle.lineBreakMode = .byTruncatingTail
        
        // 2. 기본 텍스트 속성 설정 (lineHeight 적용)
        let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .baselineOffset: (lineHeight - font.lineHeight) / 4
        ]
        
        // 3. NSMutableAttributedString 생성
        let attributedString = NSMutableAttributedString(string: text, attributes: attributes)
        
        // 4. 하이라이트 텍스트 색상 적용
        if let range = text.range(of: highlightedText) {
            let nsRange = NSRange(range, in: text)
            attributedString.addAttribute(.foregroundColor, value: highlightedTextColor, range: nsRange)
        }
        
        // 5. 설정한 attributedString을 UILabel에 적용
        attributedText = attributedString
    }
    
    /// 여러 텍스트 부분에 각각 다른 색상을 적용하는 메서드
    func multipleHighlightedTextColor(
        text: String,
        highlights: [(highlightedText: String, color: UIColor)]
    ) {
        let attributedString = NSMutableAttributedString(string: text)
        
        // 하이라이트할 각 텍스트에 색상 적용
        for highlight in highlights {
            if let range = text.range(of: highlight.highlightedText) {
                let nsRange = NSRange(range, in: text)
                attributedString.addAttribute(.foregroundColor, value: highlight.color, range: nsRange)
            }
        }
        
        attributedText = attributedString
    }
    
    /// 텍스트의 특정부분에 반전컬러를 적용
    func highlightedTextFont(
        text: String,
        highlightedText: String,
        hignlightedTextFont: UIFont
    ) {
        let attributedString = NSMutableAttributedString(string: text)
        
        let range = (text as NSString).range(of: highlightedText)
        attributedString.addAttribute(.font, value: hignlightedTextFont, range: range)
        attributedText = attributedString
    }
}
