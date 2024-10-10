//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 08/10/24.
//

import Foundation
import UIKit

class HomeCoordinator {
    
    private let navigationController: UINavigationController
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let homeVC = HomeViewController()
        navigationController.pushViewController(homeVC, animated: true)
        
        // onde acontece a troca da navigation controller
        window?.rootViewController = navigationController
    }
}
