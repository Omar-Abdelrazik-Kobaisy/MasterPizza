//
//  CartNavigator.swift
//  PizzaWorld
//
//  Created by Omar on 23/09/2023.
//

import Foundation
import UIKit
class CartNavigator : Navigator{
    var coordinator: Coordinator
    enum Destination {
        case cart
    }
    
    required init(coordinaor coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func viewController(for destenation: Destination) -> UIViewController {
        switch destenation{
        case .cart:
            let view = CartViewController.instantiate(fromAppStoryboard: .Cart)
            view.coordinator = coordinator
            view.viewModel = CartViewModel()
            
            return view
        
        }
    }
}

