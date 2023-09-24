//
//  CartItemViewModel.swift
//  PizzaWorld
//
//  Created by Omar on 24/09/2023.
//

import Foundation

class CartItemViewModel {
    let product : Product?
    let note : String?
    
    init(_ cart : Cart) {
        self.product = cart.product
        self.note = cart.notes
    }
    
}
