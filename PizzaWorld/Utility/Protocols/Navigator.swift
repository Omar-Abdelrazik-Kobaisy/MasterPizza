//
//  Navigator.swift
//  PizzaWorld
//
//  Created by Omar on 19/09/2023.
//

import Foundation
import UIKit


enum NavigationType{
    case push
    case present
    case root
}
protocol Navigator{
    associatedtype Destination
    var coordinator : Coordinator { get}
    init(coordinaor : Coordinator)
    
    func viewController(for destenation:Destination)->UIViewController
    func navigate(to destination: Destination , navigationType : NavigationType)
}
extension Navigator{
    func navigate(to destination : Destination, navigationType : NavigationType){
        let view = viewController(for: destination)
        switch navigationType{
        case .push:
            coordinator.navigationController?.pushViewController(view, animated: true)
        case .present:
            coordinator.navigationController?.present(view, animated: true)
        case .root:
            coordinator.navigationController?.setViewControllers([view], animated: true)
        }
        
    }
}
