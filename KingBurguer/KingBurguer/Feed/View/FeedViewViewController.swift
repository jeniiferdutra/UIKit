//
//  FeedViewViewController.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 22/10/24.
//

import UIKit

class FeedViewViewController: UIViewController {
    
    let test: UIView = {
        let v = UIView(frame: CGRect(x: 20, y: 90, width: 20, height: 20))
        v.backgroundColor = .purple
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(test)
    }


}
