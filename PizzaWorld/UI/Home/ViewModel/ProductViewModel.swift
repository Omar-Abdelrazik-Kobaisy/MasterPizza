//
//  ProductViewModel.swift
//  PizzaWorld
//
//  Created by Omar on 19/09/2023.
//

import Foundation

class ProductViewModel{
    var title : String
    var desc : String
    var rating : Int
    init(_ product : Product) {
        self.title = product.title ?? ""
        self.desc = product.desc ?? ""
        self.rating = product.rating ?? 0
    }
}
