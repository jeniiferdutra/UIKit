//
//  LoadingButton.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 15/10/24.
//

import Foundation
import UIKit

class LoadingButton: UIView { // toda uiview ja tem um construtor por default
    
    lazy var button: UIButton = { // lazy var = so vai chamar este bloco qnd precisarmos dele
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let progress: UIActivityIndicatorView = {
        let p = UIActivityIndicatorView()
        p.translatesAutoresizingMaskIntoConstraints = false
        return p
    }()
    
    var title: String? {
        willSet { // executa antes
            button.setTitle(newValue, for: .normal) // vai pegar o valor que esta chegando pra ele
        }
    }
    
    var titleColor: UIColor? {
        willSet {
            button.setTitleColor(newValue, for: .normal)
        }
    }
    
    override var backgroundColor: UIColor? {
        willSet {
            button.backgroundColor = newValue
        }
    }
    
    override init(frame: CGRect) { // subscrevendo o bloco
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTarget(_ target: Any?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func startLoading(_ loading: Bool) {
        button.isEnabled = !loading
        if loading {
            button.setTitle("", for: .normal)
            progress.startAnimating()
            alpha = 0.5
        } else {
            button.setTitle(title, for: .normal)
            progress.stopAnimating()
            alpha = 1.0
        }
    }
    
    private func setupViews() {
        backgroundColor = .yellow
        addSubview(button)
        addSubview(progress)
        
        let buttonConstraints = [
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let progressConstraints = [
            progress.leadingAnchor.constraint(equalTo: leadingAnchor),
            progress.trailingAnchor.constraint(equalTo: trailingAnchor),
            progress.topAnchor.constraint(equalTo: topAnchor),
            progress.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(buttonConstraints)
        NSLayoutConstraint.activate(progressConstraints)
    }
}
