//
//  SigninViewController.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 08/09/24.
//

import Foundation
import UIKit

class SigninViewController: UIViewController {
    
    let scroll: UIScrollView = {
        let sc = UIScrollView()
        sc.translatesAutoresizingMaskIntoConstraints = false // trabalhar com autolayout
        return sc
    }()
    
    let container: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBackground
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    // 1. definicao de layout
    lazy var email: UITextField = { // centralizar os componentes num lugar só
        let ed = UITextField()
        ed.borderStyle = .roundedRect
        ed.placeholder = "Entre com seu e-mail"
        ed.returnKeyType = .next
        ed.delegate = self // a viewcontroller que vai administrar os eventos
        ed.translatesAutoresizingMaskIntoConstraints = false // sempre vai ser falso
        return ed
    }()
    
    lazy var password: UITextField = {
        let ed = UITextField()
        ed.borderStyle = .roundedRect
        ed.placeholder = "Entre com sua senha"
        ed.returnKeyType = .done
        ed.delegate = self
        ed.translatesAutoresizingMaskIntoConstraints = false
        return ed
    }()
    
    lazy var send: LoadingButton = { // lazy var = so vai chamar este bloco qnd precisarmos dele
        let btn = LoadingButton()
        btn.title = "Entrar"
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(sendDidTap))
        return btn
    }()
    
    lazy var register: UIButton = {
        let btn = UIButton()
        btn.setTitle("Criar Conta", for: .normal)
        btn.setTitleColor(.label, for: .normal)
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
        
        container.addSubview(email) // jogar uma outra view (email), uma hierarquia
        container.addSubview(password)
        container.addSubview(send)
        container.addSubview(register)
        
        scroll.addSubview(container) // dentro da scrollview tem o container
        view.addSubview(scroll) // view principal tem scrollview dentro
        
        let scrollConstraints = [
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        
        let heightConstraints = container.heightAnchor.constraint(equalTo: view.heightAnchor)
        heightConstraints.priority = .defaultLow // significa q ela vai respeitar a parte crescente da altura baseado no componete da scrollview para que ele possa crescer dinamicamente
        heightConstraints.isActive = true
        let containerConstraints = [
            container.widthAnchor.constraint(equalTo: view.widthAnchor),
            container.topAnchor.constraint(equalTo: scroll.topAnchor),
            container.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            
            container.heightAnchor.constraint(equalToConstant: 500)
        ]
        
        let emailConstraints = [
            // 1. coordenadas da esquerda (leading)
            email.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            // 2. coordenadas da direita (trailing)
            email.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            // 3. coordenadas do centro
            email.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -150.0),
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
            send.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            send.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            // send.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20.0),
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
        
        NSLayoutConstraint.activate(scrollConstraints)
        NSLayoutConstraint.activate(containerConstraints)
        
        
        
        // código padrao do ios
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyboardNotification),
                                               name: UIResponder.keyboardWillHideNotification, // qnd o teclado desaparecer essa funcao sera disparads
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyboardNotification),
                                               name: UIResponder.keyboardWillShowNotification, // qnd o teclado aparecer essa funcao sera disparads
                                               object: nil)
        
    }
    
    @objc func onKeyboardNotification(_ notification: Notification) {
        let visible = notification.name == UIResponder.keyboardWillShowNotification
        
        let keyboardFrame = visible
            ? UIResponder.keyboardFrameEndUserInfoKey
            : UIResponder.keyboardFrameBeginUserInfoKey
        
        // código padrao
        if let keyboardSize = (notification.userInfo?[keyboardFrame] as? NSValue)?.cgRectValue  { // esta pegando a prop do teclado (keyboardFrame) e convertendo para um valor (as?) e transformou o mesmo em um retangulo (cgRectValue)
            onKeyboardChanged(visible, height: keyboardSize.height) // se o teclado esta aparecendo e qual a altura do teclado
        }
    }
    
    func onKeyboardChanged(_ visible: Bool, height: CGFloat) {
        if (!visible) { // se o teclado estiver escondido
            scroll.contentInset = .zero
            scroll.scrollIndicatorInsets = .zero
        } else { // se for visivel
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: height, right: 0.0) // criando um novo conteudo com margem inferior de acordo com a altura do teclado
            scroll.contentInset = contentInsets
            scroll.scrollIndicatorInsets = contentInsets
        }
    }
    
    override func viewDidAppear(_ animated: Bool) { // método que é disparado toda vez que a view aparece
        super.viewDidAppear(animated)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)) // interpreta multiplos toques
        view.addGestureRecognizer(tap) // <- vai ouvir qlq evento de touch q acontecer
    }
    
    @objc func dismissKeyboard(_ view: UITapGestureRecognizer) {
        self.view.endEditing(true) // esconder o teclado ao clicar na tela
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

extension SigninViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // metodo q vai ser disparado td vez que houver o evento de clique no botao
        if (textField.returnKeyType == .done) {
            view.endEditing(true) // se for a opcao de password
        } else {
            password.becomeFirstResponder()
        }
        return false // sempre retornar false
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
            send.startLoading(true)
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
