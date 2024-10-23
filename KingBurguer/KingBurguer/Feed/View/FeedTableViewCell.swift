//
//  FeedTableViewCell.swift
//  KingBurguer
//
//  Created by Jenifer Rocha on 23/10/24.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    static let identifier = "FeedViewCell" // static = variavel da classe e nao do objeto

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
