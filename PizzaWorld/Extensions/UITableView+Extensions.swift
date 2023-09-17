//
//  UITableView+Extensions.swift
//  PizzaWorld
//
//  Created by Omar on 16/09/2023.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type){
        self.register(UINib(nibName: String(describing: Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }


    func dequeue<cell: UITableViewCell>(cellClass : cell.Type,indexPath : IndexPath) -> cell{
        return  self.dequeueReusableCell(withIdentifier: String(describing: cell.self), for: indexPath) as! cell
    }
        
}
