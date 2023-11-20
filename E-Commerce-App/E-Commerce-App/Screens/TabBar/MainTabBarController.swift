//
//  MainTabBarController.swift
//  E-Commerce-App
//
//  Created by Yaşar Duman on 17.11.2023.
//

import UIKit

final class MainTabBarController : UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Tab bar arka plan rengi
        tabBar.backgroundColor = .tertiarySystemBackground
        
        // Seçili olan öğelerin rengi
        tabBar.tintColor = .label

        // Seçilmeyen öğelerin rengi
        tabBar.unselectedItemTintColor = .systemGray

        viewControllers = [
            createHomeNC(),
            createSearchNC(),
            createCartNC(),
            createProfileNC()
        ]
    }
    
    // MARK: - Home Navigation Controller 🏠
    private func createHomeNC() -> UINavigationController {
        let homeVC = HomeVC()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home",
                                         image: UIImage(systemName: "house"),
                                         selectedImage: UIImage(systemName: "house.fill"))
        
        return UINavigationController(rootViewController: homeVC)
    }
    
    // MARK: - Search Navigation Controller 🔍
    private func createSearchNC() -> UINavigationController {
        let searcVC = SearchVC()
        
        searcVC.tabBarItem = UITabBarItem(title: "Search",
                                          image: UIImage(systemName: "magnifyingglass"),
                                          selectedImage: UIImage(systemName: "magnifyingglass"))
        
        return UINavigationController(rootViewController: searcVC)
    }
    
    // MARK: - Shopping Cart Navigation Controller 🛒
    private func createCartNC() -> UINavigationController {
        let cartVC = CartVC()
        
        cartVC.tabBarItem = UITabBarItem(title: "Cart",
                                         image: UIImage(systemName: "cart"),
                                         selectedImage: UIImage(systemName: "cart.fill"))
        
        return UINavigationController(rootViewController: cartVC)
    }
    
    // MARK: - Profile Navigation Controller ⚙️
    private func createProfileNC() -> UINavigationController {
        let profileVC = ProfileVC()
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile",
                                            image: UIImage(systemName: "person"),
                                            selectedImage: UIImage(systemName: "person.fill"))
        
        return UINavigationController(rootViewController: profileVC)
    }
}
