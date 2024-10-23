//
//  FeedViewViewController.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 22/10/24.
//

import UIKit

class FeedViewViewController: UIViewController {
    
    private let homeFeedTable: UITableView = {
        let tv = UITableView()
        // uitableview trabalha em conjunto com a uitablecell
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cellid")
        tv.backgroundColor = UIColor.cyan
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(homeFeedTable)
        
        homeFeedTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

}

extension FeedViewViewController: UITableViewDataSource {
    
    // numero de linhas na secao
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    // mensagem de texto
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        cell.textLabel?.text = "Olá, Mundo! \(indexPath.row)" // indexpath vai mostrar a quant de linhas
        
        return cell
    }
    
    
}
