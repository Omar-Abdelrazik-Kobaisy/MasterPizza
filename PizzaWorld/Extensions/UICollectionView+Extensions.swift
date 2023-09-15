//
//  UICollectionView+Extensions.swift
//  PizzaWorld
//
//  Created by Omar on 14/09/2023.
//

import Foundation
import UIKit
extension UICollectionView {
    func registerCell<cell : UICollectionViewCell>(cellClass : cell.Type){
        self.register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: cell.self))
    }
    
    func dequeue<cell : UICollectionViewCell>(cellClass : cell.Type,indexPath : IndexPath) -> cell{
       return  self.dequeueReusableCell(withReuseIdentifier: String(describing: cell.self), for: indexPath) as! cell
        
    }
}
