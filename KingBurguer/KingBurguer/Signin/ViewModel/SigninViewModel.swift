//
//  SigninViewModel.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 11/09/24.
//

import Foundation

protocol SignInViewModelDelegate {
    func viewModelDidChanged(state: SigninState)
}

class SigninViewModel {
    
    var delegate: SignInViewModelDelegate?
    var coordinator: SignInCoordinator?
    
    var state: SigninState = .none {
        didSet { // vai ser disparada qnd mudar o state
            delegate?.viewModelDidChanged(state: state) // delegate é pra avisar que algo mudou atraves do protocol
        }
    }
    
    func send() {
        state = .loading
        
        // aqui eu espero 2 segundos (LATENCIA DE REDE)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .goToHome // usar self pq dentro desse bloco n tem a ref da classe
        }
    }
    
    func goToSignUp() {
        coordinator?.signUp()
    }
    
    func goToHome() {
        coordinator?.home()
    }
}
