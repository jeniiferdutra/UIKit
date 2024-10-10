//
//  SignUpViewModel.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 02/10/24.
//

import Foundation

protocol SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState)
}

class SignUpViewModel {
    
    var delegate: SignUpViewModelDelegate?
    var coordinator: SignUpCoordinator?
    
    var state: SignUpState = .none {
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
    
    func goToHome() {
        coordinator?.home()
    }

}
