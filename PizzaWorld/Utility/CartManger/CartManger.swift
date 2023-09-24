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
        return items.value.count
    }
    
    var totalCoast : Double{
        var sum : Double = 0
        let _ = items.value.map{ item in
            sum += (Double(item.product?.quantity ?? 0) * (item.product?.price ?? 0.0))
        }
        
        return round(sum)
    }
    
    func add(product : Product , notes : String? = nil){
        if let productIndex = items.value.firstIndex(where: { item in
            item.product?.title == product.title
        }){
            let arr = items.value
            arr[productIndex].product?.quantity += 1
            items.accept(arr)
        }else{
            let cartItem = Cart(product: product, notes: notes)
            items.accept(items.value + [cartItem])
        }
    }
    
}
