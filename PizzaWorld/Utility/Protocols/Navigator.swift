//
//  Navigator.swift
//  PizzaWorld
//
//  Created by Omar on 19/09/2023.
//

import Foundation
import UIKit

protocol Navigator{
    associatedtype Destination
    var coordinator : Coordinator { get}
    init(coordinaor : Coordinator)
    
    func viewController(for destenation:Destination)->UIViewController
    func navigate(to destination: Destination)
}
extension Navigator{
    func navigate(to destination : Destination){
        let view = viewController(for: destination)
        coordinator.navigationController?.pushViewController(view, animated: true)
    }
}
