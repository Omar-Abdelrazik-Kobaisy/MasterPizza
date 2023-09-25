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
    let quantity : Int
    
    init(_ cart : Cart) {
        self.product = cart.product
        if let note = cart.notes{
            self.note = "Notes : \(note)"
        }else{
            self.note = "Notes : No Notes"
        }
        self.quantity = cart.quantity
    }
    
}
