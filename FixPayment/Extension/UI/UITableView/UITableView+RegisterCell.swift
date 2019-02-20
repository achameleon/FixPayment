//
//  UITableView+RegisterCell.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(cell: UITableViewCell.Type) {
        let nib = UINib(nibName: cell.identifier, bundle: Bundle.main)
        register(nib, forCellReuseIdentifier: cell.identifier)
    }
    
    func dequeue<Cell: UITableViewCell>(cell: Cell.Type) -> Cell {
        return dequeueReusableCell(withIdentifier: cell.identifier) as! Cell
    }
    
}

extension UITableViewCell {
    
    static var identifier: String {
        return "\(self)"
    }
    
}
