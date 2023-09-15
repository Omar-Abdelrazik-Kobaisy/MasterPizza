//
//  HomeViewModel.swift
//  PizzaWorld
//
//  Created by Omar on 15/09/2023.
//

import Foundation
import RxSwift
import RxCocoa
class HomeViewModel{
//MARK: PRIVATE ITEMS OWNS BY VIEWMODEL
    private var sliderTimer : Timer?
    private var slides : BehaviorRelay<[Int]> = BehaviorRelay(value: [1,2,3,4,5])
    private var currentSlides = 0
//MARK: PUBLIC VARIABLES
    var numberOfItems : Int {
        return slides.value.count
    }
//MARK: OUTPUT
//    var slideToItemAtIndex : ((Int)->Void) = {_ in }
    var slideToItemAtIndex : PublishSubject<Int> = PublishSubject<Int>() // act as observable & observer
//MARK: INPUT
    func viewDidLoad(){
        sliderTimer = Timer.scheduledTimer(timeInterval: 5 , target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    @objc func scrollToNextItem(){
        let next = currentSlides + 1;
        currentSlides = next % slides.value.count
//        slideToItemAtIndex(currentSlides)
        slideToItemAtIndex.onNext(currentSlides)
    }
}
