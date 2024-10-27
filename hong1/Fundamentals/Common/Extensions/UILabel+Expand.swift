//
//  UILabel+Expand+.swift
//  ABEE
//
//  Created by 엄지호 on 10/2/24.
//

import UIKit

extension UILabel {
    private var visibleTextLength: Int {
        // UILabel의 폰트와 줄바꿈 모드를 가져옴
        let font: UIFont = self.font
        
        // UILabel의 너비와 높이를 가져옴
        let labelWidth: CGFloat = UIScreen.main.bounds.width - (20 + 34)  // 왼쪽, 오른쪽 공백 제거한 라벨 width
        let labelHeight: CGFloat = 37  // 설정한 라벨 Height
        
        // UILabel에 들어갈 수 있는 텍스트의 최대 크기를 정의
        let sizeConstraint = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude) // 최대 높이는 제한 없음
        
        if let myText = self.text {
            // 텍스트에 적용할 속성을 정의 (폰트 설정)
            let attributes: [AnyHashable: Any] = [NSAttributedString.Key.font: font]
            
            // NSAttributedString을 사용하여 텍스트에 폰트 속성을 적용
            let attributedText = NSAttributedString(
                string: myText,
                attributes: attributes as? [NSAttributedString.Key: Any]
            )
            
            // 지정된 크기 내에서 텍스트가 차지하는 실제 크기를 계산 (여러 줄 포함 가능)
            let boundingRect: CGRect = attributedText.boundingRect(
                with: sizeConstraint,
                options: .usesLineFragmentOrigin,
                context: nil
            )
            
            // 계산된 텍스트 높이가 UILabel의 높이를 초과하는지 확인
            if boundingRect.size.height > labelHeight {
                // 텍스트가 레이블을 초과할 경우 몇 글자까지 보여질 수 있는지 계산
                var index: Int = 0  // 현재 텍스트에서 몇 번째 글자를 확인하고 있는지 체크
                var prev: Int = 0   // 직전까지 자를 수 있었던 유효한 글자 수 체크 (마지막 반환에 사용)
                let characterSet = CharacterSet.whitespacesAndNewlines // 공백 및 줄바꿈 문자
                
                repeat {
                    // 현재까지 계산된 텍스트의 길이를 기록
                    prev = index
                    
                    // 단어 단위 줄바꿈이니, 다음 공백이나 줄바꿈 문자의 위치를 찾음
                    index = (myText as NSString).rangeOfCharacter(
                        from: characterSet,
                        options: [],
                        range: NSRange(
                            location: index + 1,
                            length: myText.count - index - 1)).location
                    
                    // 텍스트 길이를 늘려가며 UILabel에 들어갈 수 있는지 확인
                } while index != NSNotFound  // 공백을 찾을 수 없으면 루프 종료
                    && index < myText.count  // 텍스트의 끝에 도달했을 경우 루프 종료
                    && (myText as NSString)  // 현재까지의 텍스트를 자르고, 라벨의 height와 비교 -> 현재 텍스트가 더 크면 종료
                        .substring(to: index)
                        .boundingRect(
                            with: sizeConstraint,
                            options: .usesLineFragmentOrigin,
                            attributes: attributes as? [NSAttributedString.Key: Any],
                            context: nil)
                        .size
                        .height <= labelHeight // 레이블 높이를 넘지 않는지 확인
                    
                return prev // 마지막으로 레이블에 들어갈 수 있는 글자 수를 반환
            }
        }
        
        
        if self.text == nil { return 0 }  // 텍스트가 없을 경우 0을 반환
        else { return self.text!.count }  // 텍스트가 라벨 안에 전부 들어갈 수 있음
    }

    
    // Label에 "... 더보기"와 같은 텍스트를 추가하기 위한 함수
    func apendingMoreText(
        _ moreText: String,
        moreTextFont: UIFont,
        moreTextColor: UIColor
    ) {
        // 라벨에 표시할 수 있는 텍스트 길이가 0이면 함수 종료
        let lengthForVisibleString = self.visibleTextLength
        guard lengthForVisibleString != 0 else { return }
        
        // 텍스트가 모두 들어가는 경우 함수 종료
        guard let myText = self.text, lengthForVisibleString != myText.count else { return }
        
        // 표시 가능한 길이 이후의 텍스트를 잘라냄
        let trimmedString: String? = (myText as NSString).replacingCharacters(
            in: NSRange(
                location: lengthForVisibleString,              // 잘라낼 시작 위치
                length: myText.count - lengthForVisibleString  // 잘라낼 텍스트의 길이
            ),
            with: ""  // ""로 대체
        )
        
        // "... 더보기" 텍스트의 길이
        let readMoreLength = (moreText.count)
        
        // 잘라낸 텍스트가 nil인지 확인 (안전한 값인지 확인)
        guard let safeTrimmedString = trimmedString else { return }
        
        // 잘라낸 텍스트가 "... 더보기" 텍스트보다 짧을 경우 함수 종료
        guard safeTrimmedString.count > readMoreLength else { return }
        
        // "... 더보기"를 추가할 수 있도록 텍스트를 잘라내고 더보기 텍스트를 덧붙임
        let trimmedForReadMore = (safeTrimmedString as NSString)
            .replacingCharacters(
                in: NSRange(
                    location: safeTrimmedString.count - readMoreLength,  // 잘라낼 시작 위치
                    length: readMoreLength  // 잘라낼 텍스트 길이 ("... 더보기"에 맞춤)
                ), with: ""
            )
        
        // 잘린 텍스트와 폰트를 포함한 속성을 NSMutableAttributedString에 설정
        let answerAttributed = NSMutableAttributedString(
            string: trimmedForReadMore,
            attributes: [NSAttributedString.Key.font: self.font as Any]
        )
        
        // "더보기" 텍스트의 폰트와 색상을 속성으로 가진 NSAttributedString 생성
        let readMoreAttributed = NSMutableAttributedString(
            string: moreText,
            attributes: [NSAttributedString.Key.font: moreTextFont,
                         NSAttributedString.Key.foregroundColor: moreTextColor]
        )
        
        // 잘린 텍스트 뒤에 "더보기" 텍스트를 추가
        answerAttributed.append(readMoreAttributed)
        
        // 최종적으로 생성한 NSAttributedString을 레이블에 설정
        self.attributedText = answerAttributed
    }

}
