//
//  CartManger.swift
//  PizzaWorld
//
//  Created by Omar on 24/09/2023.
//

import Foundation
import RxSwift
import RxCocoa
class CartManger {
    
    static let shared = CartManger()
    private var items : BehaviorRelay<[Cart]> = BehaviorRelay<[Cart]>(value: [])
    var itemsObservable : Observable<[Cart]>
    private init(){
        itemsObservable = items.asObservable()
    }
    
    var itemsCount : Int {
        var total : Int = 0
        let _ = items.value.map{ item in
            total += item.quantity
        }
        return  total
    }
    
    var totalCoast : Double{
        var sum : Double = 0
        let _ = items.value.map{ item in
            sum += (Double(item.quantity ) * (item.product?.price ?? 0.0))
        }
        
        return round(sum)
    }
    
    func add(product : Product ,quantity : Int = 1, notes : String? = nil){
        if let productIndex = items.value.firstIndex(where: { item in
            item.product?.title == product.title
        }){
            var arr = items.value
            arr[productIndex].quantity += quantity
            items.accept(arr)
        }else{
            var cartItem = Cart(product: product, notes: notes)
            cartItem.quantity = quantity
            items.accept(items.value + [cartItem])
        }
    }
    
    func delete(product : Product?){
        if let productIndex = items.value.firstIndex(where: { item in
            item.product?.title == product?.title
        }){
            var arr = items.value
            arr.remove(at: productIndex)
            items.accept(arr)
        }
    }
    
}
