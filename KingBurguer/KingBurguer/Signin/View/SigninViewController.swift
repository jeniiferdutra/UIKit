//
//  SigninViewController.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 08/09/24.
//

import Foundation
import UIKit

class SigninViewController: UIViewController {
    
    // 1. definicao de layout
    let email: UITextField = { // centralizar os componentes num lugar só
        let ed = UITextField()
        ed.backgroundColor = .blue
        ed.placeholder = "Entre com seu e-mail"
        ed.translatesAutoresizingMaskIntoConstraints = false // sempre vai ser falso
        return ed
    }()
    
    let password: UITextField = {
        let ed = UITextField()
        ed.backgroundColor = .red
        ed.placeholder = "Entre com sua senha"
        ed.translatesAutoresizingMaskIntoConstraints = false
        return ed
    }()
    
    lazy var send: UIButton = { // lazy var = so vai chamar este bloco qnd precisarmos dele
        let btn = UIButton()
        btn.setTitle("Entrar", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .yellow
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(sendDidTap), for: .touchUpInside)
        return btn
    }()
    
    lazy var register: UIButton = {
        let btn = UIButton()
        btn.setTitle("Criar Conta", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .purple
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(registerDidTap), for: .touchUpInside)
        return btn
    }()
    
    var viewModel: SigninViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // qnd for enum podemos emitir o nome da enum
        
        navigationItem.title = "Login"
        
        view.addSubview(email) // jogar uma outra view (email), uma hierarquia
        view.addSubview(password)
        view.addSubview(send)
        view.addSubview(register)
        
        let emailConstraints = [
            // 1. coordenadas da esquerda (leading)
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            // 2. coordenadas da direita (trailing)
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // 3. coordenadas do centro
            email.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            // 4. coordenadas (tamanho fixo) do height
            email.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let passwordConstraits = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
            password.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let sendConstraits = [
            send.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            send.trailingAnchor.constraint(equalTo: password.trailingAnchor),
            send.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10.0),
            send.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        let registerConstraits = [
            register.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            register.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            register.topAnchor.constraint(equalTo: send.bottomAnchor, constant: 15.0),
            register.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        
        NSLayoutConstraint.activate(passwordConstraits)
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(sendConstraits)
        NSLayoutConstraint.activate(registerConstraits)
        
    }
    
    // 2. evento de touch
    @objc func sendDidTap(_ sender: UIButton) { // padrao
        viewModel?.send()
    }
    
    @objc func registerDidTap(_ sender: UIButton) {
        // navegar para outra tela
        viewModel?.goToSignUp()
    }
}

// 3. observadores
// extensao da classe, tem o msm comportamento se tivesse dentro da classe
// manter dentro da classe somente interface grafica e eventos de touch
extension SigninViewController: SignInViewModelDelegate {
    // OBSERVADOR (O.O) olhando qlq mudanca de estado do viewModel
    func viewModelDidChanged(state: SigninState) {
        switch(state) { // viewmodel que dispara esse metodo
        case .none:
            break
        case .loading:
            // mostrar o progress
            break
        case .goToHome:
            // navegar pela tela principal
            viewModel?.goToHome()
            break
        case .error(let msg):
            let alert = UIAlertController(title: "Titulo", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)// funcao padrao de toda viewController
            break
        }
    }
}
