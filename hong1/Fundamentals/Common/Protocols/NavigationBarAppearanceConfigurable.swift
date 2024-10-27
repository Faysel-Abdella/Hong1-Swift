//
//  Reusable.swift
//  ScheduleCalendarProject
//
//  Created by 엄지호 on 10/7/24.
//

import UIKit
    
/// 내비게이션 바의 appearance를 설정할 수 있는 프로토콜
protocol NavigationBarAppearanceConfigurable: UIViewController {
    func configureDefaultNavigationBarAppearance(with backgroundColor: UIColor)
}

// MARK: - Navigation bar
extension NavigationBarAppearanceConfigurable {
    var backButtonImage: UIImage? {
        UIImage(named: "back")?
            .resize(to: CGSize(width: 24, height: 24))
            .withAlignmentRectInsets(UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0))
    }
    
    func configureDefaultNavigationBarAppearance(with backgroundColor: UIColor = .clear) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        appearance.shadowColor = nil
        appearance.titleTextAttributes = [
            .font: UIFont.ptBold18Font ?? .boldSystemFont(ofSize: 18),
            .foregroundColor: UIColor.color242424
        ]
        
        // Back button 타이틀 숨김 처리
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backButtonAppearance
        
        
        navigationController?.navigationBar.tintColor = .color242424
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
    }
}

extension UIViewController: NavigationBarAppearanceConfigurable { }
