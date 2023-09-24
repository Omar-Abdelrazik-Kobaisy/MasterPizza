//
//  Coordinator.swift
//  PizzaWorld
//
//  Created by Omar on 18/09/2023.
//

import Foundation
import UIKit
protocol Coordinator {
    var Main : MainNavigator {get }
    var Cart : CartNavigator {get }
    var navigationController : UINavigationController? { get}
}
class AppCoordinator :Coordinator
{
    private var window : UIWindow
    private lazy var tabBar : CustomeTabBarController = {
        return CustomeTabBarController(coordinator: self)
    }()
    var navigationController : UINavigationController? {
        guard let navigationController = tabBar.selectedViewController as? UINavigationController else {return nil}
        return navigationController
    }
    lazy var Main: MainNavigator = {
        return MainNavigator(coordinaor: self)
    }()
    lazy var Cart: CartNavigator = {
        return CartNavigator(coordinaor: self)
    }()
    init(window: UIWindow ) {
        self.window = window
        
    }
    
    func start(){
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    var rootViewController : UIViewController {
        return tabBar
    }
}
