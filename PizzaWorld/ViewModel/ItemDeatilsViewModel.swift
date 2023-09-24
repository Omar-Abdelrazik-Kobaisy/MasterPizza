//
//  ItemDeatilsViewModel.swift
//  PizzaWorld
//
//  Created by Omar on 19/09/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol ItemDetailsViewModelOutPut {
    var displayMainData : PublishSubject<ProductViewModel> { get }
}
protocol ItemDetailsViewModelInPut {
    func viewDidLoad()
}
class ItemDetailsViewModel : ItemDetailsViewModelInPut & ItemDetailsViewModelOutPut {
    var displayMainData: PublishSubject<ProductViewModel> = PublishSubject<ProductViewModel>()
    let product : Product
    
    init(product: Product) {
        self.product = product
    }
    func viewDidLoad() {
        let product = ProductViewModel(product)
        displayMainData.onNext(product)
    }
    
    func didPressAddToCart(){
        CartManger.shared.add(product: product)
    }
}
