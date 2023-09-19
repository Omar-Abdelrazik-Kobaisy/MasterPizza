//
//  Navigators.swift
//  PizzaWorld
//
//  Created by Omar on 19/09/2023.
//

import Foundation
import UIKit
class MainNavigator : Navigator{
    var coordinator: Coordinator
    enum Destination {
        case home
    }
    
    required init(coordinaor coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func viewController(for destenation: Destination) -> UIViewController {
        switch destenation{
        case .home:
            let view = HomeViewController(coordinator: coordinator, viewModel: HomeViewModel())
            return view
        }
    }
}
