//
//  Product.swift
//  PizzaWorld
//
//  Created by Omar on 16/09/2023.
//

import Foundation
class Product {
    var title : String?
    var desc : String?
    var rating : Int?
    var price : Double?
    
    init(title: String? = nil, desc: String? = nil, rating: Int? = nil , price : Double? = nil) {
        self.title = title
        self.desc = desc
        self.rating = rating
        self.price = price
    }
}
