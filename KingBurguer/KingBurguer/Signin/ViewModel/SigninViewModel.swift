//
//  SigninViewModel.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 11/09/24.
//

import Foundation

protocol SignInViewModelDelegate {
    func viewModelDidChanged(viewModel: SigninViewModel)
}

class SigninViewModel {
    
    var delegate: SignInViewModelDelegate?
    
    var state: Bool = false {
        didSet { // vai ser disparada qnd mudar o state
            delegate?.viewModelDidChanged(viewModel: self)
        }
    }
    
    func send() {
        state = true // toda vez que o usuario apertar o botao ela vai ficar verdadeira
    }
}
