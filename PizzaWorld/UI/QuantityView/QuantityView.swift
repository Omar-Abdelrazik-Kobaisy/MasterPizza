//
//  QuantityView.swift
//  PizzaWorld
//
//  Created by Omar on 22/09/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
class QuantityView : NibLoadingView{
    
    @IBOutlet weak var quantity: UILabel!
    private var currentValue : BehaviorRelay<Int> = BehaviorRelay<Int>(value: 1)
    private let bag = DisposeBag()
    
    public var value : Int {
        currentValue.value
    }
    lazy var currentValueObservable : Observable<Int> = {
        return currentValue.asObservable()
    }()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup(){
        currentValue.subscribe(onNext : { [weak self]quantity in
            self?.quantity.text = "\(quantity)"
        }).disposed(by: bag)
    }
    
    
    @IBAction func didPressPlus(_ sender: Any) {
        currentValue.accept(currentValue.value + 1)
    }
    
    
    @IBAction func didPressMinus(_ sender: Any) {
        guard currentValue.value > 0 else{return}
        currentValue.accept(currentValue.value - 1)
    }
}
