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
        // O ViewModel serve como um intermediário entre a View (interface gráfica) e os dados (Model). Ele não interage diretamente com a interface, mas processa os dados que a View vai exibir e lida com eventos da interface (como cliques em botões ou entradas do usuário)
        
        let signinVC = SigninViewController() // criar a instancia e associando o viewmodel a controladora de visualizacao
        signinVC.viewModel = viewModel
        
        navigationController.pushViewController(signinVC, animated: true)
                
        window?.rootViewController =  navigationController // controlador principal
        window?.makeKeyAndVisible() // se nao chamar a tela n aparece
    }
}
