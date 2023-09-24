//
//  CartViewModel.swift
//  PizzaWorld
//
//  Created by Omar on 24/09/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol CartViewModelInput{
    
}
protocol CartViewModelOutput{
    var cartItemObservable : Observable<[CartItemViewModel]> { get}
}

protocol CartViewModelProtocol : CartViewModelInput & CartViewModelOutput {
    var input : CartViewModelInput {get }
    var output : CartViewModelOutput {get }
}
class CartViewModel : CartViewModelProtocol{
   
    private var cartItems : BehaviorRelay<[CartItemViewModel]> = BehaviorRelay<[CartItemViewModel]>(value:[ CartItemViewModel(Cart(product: Product(title: "pizza;)",desc: "",rating: 3), notes: "good")),CartItemViewModel(Cart(product: Product(title: "Burger;)",desc: "",rating: 3), notes: "good"))])
    
    var input : CartViewModelInput {
        return self
    }
    var output : CartViewModelOutput {
        return self
    }
    //outputs
    var cartItemObservable: Observable<[CartItemViewModel]>  {
        return cartItems.asObservable()
    }
}
