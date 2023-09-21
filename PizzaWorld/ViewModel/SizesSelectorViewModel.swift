//
//  SizesSelectorViewModel.swift
//  PizzaWorld
//
//  Created by Omar on 20/09/2023.
//

import Foundation
import RxSwift
import RxCocoa
protocol SizesSelectorViewModelInput{
    
}
protocol SizesSelectorViewModelOutput{
//    var itemsObservable : Observable<[Size]> { get}
    var itemsObservable : Observable<[SizeItemCellViewModel]> { get}
}

class SizesSelectorViewModel : SizesSelectorViewModelInput & SizesSelectorViewModelOutput{
    var input : SizesSelectorViewModelInput{
        self
    }
    var output : SizesSelectorViewModelOutput{
        self
    }
    private var items :BehaviorRelay<[Size]> = BehaviorRelay<[Size]>(value: [Size(name: "large"),Size(name: "small")])
    
    private var itemsViewModel :BehaviorRelay<[SizeItemCellViewModel]> = BehaviorRelay<[SizeItemCellViewModel]>(value: [])
    
    // output
//    var itemsObservable: Observable<[Size]>
    var itemsObservable: Observable<[SizeItemCellViewModel]>
    init() {
        self.itemsObservable = itemsViewModel.asObservable()
        let mappedItems = items.value.map { size in
            SizeItemCellViewModel(size: size)
        }
        itemsViewModel.accept(mappedItems)
    }
}
