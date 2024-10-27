//
//  MainTabBarViewController.swift
//  hong1
//
//  Created by Yohannes Haile on 10/21/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabBar()
    }
    
    private func setUpTabBar(){
        view.backgroundColor = .systemBackground
        
    
    
        
        let home = UINavigationController(rootViewController: AdvertiseViewController())
        home.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "unselectedhome"), selectedImage: nil)
    
        let store = UINavigationController(rootViewController: StoreViewController())
        store.tabBarItem = UITabBarItem(title: "상점", image: UIImage(named: "unselectedcart")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "cart")?.withRenderingMode(.alwaysOriginal))
        
        let adStorage = UINavigationController(rootViewController: AdStorageViewController())
        adStorage.tabBarItem = UITabBarItem(title: "광고보관", image: UIImage(named: "unselectedwallet")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "wallet")?.withRenderingMode(.alwaysOriginal))
        
        let profile = UINavigationController(rootViewController: MyPageViewController())
        profile.tabBarItem = UITabBarItem(title: "마이", image: UIImage(named: "unselectedmy")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "my")?.withRenderingMode(.alwaysOriginal))
        
        
    
        self.tabBar.tintColor = UIColor.color1d232c
        self.tabBar.unselectedItemTintColor = UIColor.colorb3b8c5

        self.setViewControllers([home, store, adStorage, profile], animated: true)
    }
}
