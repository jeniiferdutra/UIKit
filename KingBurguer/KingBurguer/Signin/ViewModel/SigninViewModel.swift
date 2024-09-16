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
    
    var state: SigninState = .none {
        didSet { // vai ser disparada qnd mudar o state
            delegate?.viewModelDidChanged(state: state) // delegate é pra avisar que algo mudou atraves do protocol
        }
    }
    
    func send() {
        state = .loading
        
        // aqui eu espero 2 segundos (LATENCIA DE REDE)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .error("Usuário nao existe") // usar self pq dentro desse bloco n tem a ref da classe
        }
    }
    
    
    // 1. NADA - preparado para receber o imput
    // 2. CARREGANDO
    // 3. SUCESSO - navegar para tela principal
    // 4. ERRO - mostrar uma mensagem vinda do servidor (usuario nao existe)
}
