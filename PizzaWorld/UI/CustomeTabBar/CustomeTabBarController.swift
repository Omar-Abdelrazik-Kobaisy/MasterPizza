//
//  CustomeTabBarController.swift
//  PizzaWorld
//
//  Created by Omar on 17/09/2023.
//

import UIKit

class CustomeTabBarController: UITabBarController {

    enum TabBarItems :Int ,CaseIterable{
        case Home
        case PizzaMaker
        case Cart
    }
    lazy var middelButton : UIButton = {
       var button = UIButton()
        let image : UIImage = #imageLiteral(resourceName: "PizzaTabBar")
        button.setImage(image, for: .normal)
        button.backgroundColor = .pinkishRed
        button.imageEdgeInsets = .init(top: 0, left: 2, bottom: 0, right: 0)
        return button
    }()
    
    var coordinator : Coordinator
    
    init(coordinator : Coordinator){
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(CustomeTabBar(), forKey: "tabBar") // to link CustomeTabBar with CustomeTabBarController
        setupTabBarItem()
        setupUI()
        createMiddleButton()
    }
    private func createMiddleButton(){
        tabBar.addSubview(middelButton)
        middelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middelButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            middelButton.widthAnchor.constraint(equalToConstant: 55),
            middelButton.heightAnchor.constraint(equalToConstant: 55),
            middelButton.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -15)
        ])
        middelButton.layer.cornerRadius = 25
    }
    private func setupUI(){
        tabBar.tintColor = .darkBlueGrey
        tabBar.unselectedItemTintColor = .pinkishRed
        tabBar.items?[TabBarItems.PizzaMaker.rawValue].isEnabled = false
        middelButton.addTarget(self, action: #selector(didPressMiddleButton), for: .touchUpInside)
    }
    
    @objc func didPressMiddleButton(){
        print("Middle Button Clicked")
    }
    //create funcion setupTabBarItems iterate on enum
    private func setupTabBarItem(){
        self.viewControllers = TabBarItems.allCases.map{
            let root = viewControllerForTabBarItem($0)
            return UINavigationController.init(rootViewController: root)
        }
    }
    // create function generate every controller for a specific tabBarItem
    private func viewControllerForTabBarItem(_ item: TabBarItems) -> UIViewController{
        let view : UIViewController
        switch item{
        case .Home:
            view = coordinator.Main.viewController(for: .home)
            view.tabBarItem = tabBarItem(for: item)
        case .PizzaMaker:
            view = coordinator.Main.viewController(for: .home)
            view.tabBarItem = tabBarItem(for: item)
        case .Cart:
            view = coordinator.Main.viewController(for: .home)
            view.tabBarItem = tabBarItem(for: item)
        }
        return view
    }
    //create function for tabBarItem which will be injected to viewController
    private func tabBarItem(for item: TabBarItems) ->UITabBarItem?{
        let tabBarItem : UITabBarItem
        let image : UIImage
        switch item{
        case .Home:
            image = #imageLiteral(resourceName: "group4")
            tabBarItem = .init(title: "Home", image: image, selectedImage: image)
        case .PizzaMaker:
            return nil
        case .Cart:
            image = #imageLiteral(resourceName: "cart")
            tabBarItem = .init(title: "Cart", image: image, selectedImage: image)
        }
        tabBarItem.titlePositionAdjustment = .init(horizontal: 0, vertical: 15)
        tabBarItem.imageInsets = .init(top: 10, left: 0, bottom: -10, right: 0)
        return tabBarItem
    }
}
