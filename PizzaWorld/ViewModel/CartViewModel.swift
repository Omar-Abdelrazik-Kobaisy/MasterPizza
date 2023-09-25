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
    func didDeleteItem(at indexPath : IndexPath)
}
protocol CartViewModelOutput{
    var cartItemObservable : Observable<[CartItemViewModel]> { get}
//    var cartHeaderDidChange : Observable<CartHeaderViewModel> { get}
}

protocol CartViewModelProtocol : CartViewModelInput & CartViewModelOutput {
    var input : CartViewModelInput {get }
    var output : CartViewModelOutput {get }
}
class CartViewModel : CartViewModelProtocol{
   
    private var cartItems : BehaviorRelay<[CartItemViewModel]> = BehaviorRelay<[CartItemViewModel]>(value:[])
//    private var cartHeaderItem : PublishSubject<CartHeaderViewModel> = PublishSubject<CartHeaderViewModel>()
    private let bag = DisposeBag()
    private var items : [Cart] = []
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
//    var cartHeaderDidChange : Observable<CartHeaderViewModel> {
//        return cartHeaderItem.asObservable()
//    }
    
    func bind(){
        CartManger.shared.itemsObservable.subscribe(onNext : {[unowned self]items in
            self.items = items
            let mappedItems = items.map(CartItemViewModel.init)
            self.cartItems.accept(mappedItems)
        }).disposed(by: bag)
    }
    func didDeleteItem(at indexPath: IndexPath) {
        CartManger.shared.delete(product: items[indexPath.row].product)
    }
}
