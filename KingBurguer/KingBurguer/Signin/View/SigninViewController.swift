//
//  SigninViewController.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 08/09/24.
//

import Foundation
import UIKit

class SigninViewController: UIViewController {
    
    let email: UITextField = { // centralizar os componentes num lugar só
        let ed = UITextField()
        ed.backgroundColor = .white
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green // qnd for enum podemos emitir o nome da enum
        
        view.addSubview(email) // jogar uma outra view (email), uma hierarquia
        //email.frame = CGRect(x: 0, y: view.bounds.size.height / 2, width: view.bounds.size.width, height: 50)
        view.addSubview(password)

        
        // PROBLEMAS AO USAR FRAME!!
        // 1. tem que fazer mta matematica a proporçao da tela
        // 2. nao tem autolayout
        
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
        NSLayoutConstraint.activate(emailConstraints)
        
        let passwordConstrait = [
            password.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: email.trailingAnchor),
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10.0),
            password.heightAnchor.constraint(equalToConstant: 50.0)
        ]
        NSLayoutConstraint.activate(passwordConstrait)
        
        
        view.addSubview(password)
        //password.frame = CGRect(x: 0, y: (view.bounds.size.height / 2) + 50, width: view.bounds.size.width, height: 50)
        
    }
    
}
