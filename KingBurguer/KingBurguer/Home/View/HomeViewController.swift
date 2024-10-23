//
//  HomeViewController.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 08/10/24.
//

import Foundation
import UIKit

class HomeViewController: UITabBarController {
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let feedVC = UINavigationController(rootViewController: FeedViewViewController())
        let couponVC = UINavigationController(rootViewController: CouponViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewViewController())
        
        feedVC.title = "Inicio"
        couponVC.title = "Cupons"
        profileVC.title = "Perfil"
        
        tabBar.tintColor = .red
        
        feedVC.tabBarItem.image = UIImage(systemName: "house")
        couponVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        profileVC.tabBarItem.image = UIImage(systemName: "person.circle")
        
        setViewControllers([feedVC, couponVC, profileVC], animated: true)
    }
}
