//
//  SigninViewController.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 08/09/24.
//

import Foundation
import UIKit

class SigninViewController: UIViewController {
    
    let email: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green // qnd for enum podemos emitir o nome da enum
        
        view.addSubview(email) // jogar uma outra view (email), uma hierarquia
        email.backgroundColor = .white
        email.placeholder = "Entre com seu e-mail"
        email.frame = CGRect(x: 0, y: view.bounds.size.height / 2, width: view.bounds.size.width, height: 50)
        
    }
    
}
