//
//  SignInCoordinator.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 25/09/24.
//

import Foundation
import UIKit

class SignInCoordinator {
    
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let viewModel = SigninViewModel()
        viewModel.coordinator = self
        
        let signinVC = SigninViewController()
        signinVC.viewModel = viewModel
        
        navigationController.pushViewController(signinVC, animated: true)
                
        window?.rootViewController =  navigationController // controlador principal
        window?.makeKeyAndVisible() // se nao chamar a tela n aparece
    }
    
    func signUp() {
        let signUpCoordinator = SignUpCoordinator(navigationController: navigationController)
        signUpCoordinator.parentCoordinator = self 
        signUpCoordinator.start()
    }
    
    func home() {
        let homeCoordinator = HomeCoordinator(window: window)
        homeCoordinator.start()
    }
}
