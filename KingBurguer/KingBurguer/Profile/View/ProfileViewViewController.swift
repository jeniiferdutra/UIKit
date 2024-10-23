//
//  ProfileViewViewController.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 22/10/24.
//

import UIKit

class ProfileViewViewController: UIViewController {

    let test: UIView = {
        let v = UIView(frame: CGRect(x: 20, y: 90, width: 20, height: 20))
        v.backgroundColor = .yellow
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(test)
    }


}
