//
//  BaseViewController.swift
//  PizzaWorld
//
//  Created by Omar on 19/09/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
class BaseViewController<T> : UIViewController{
    var coordinator : Coordinator?
    var viewModel : T?
    lazy var bag = {DisposeBag()}()
    
    init(coordinator: Coordinator?, viewModel: T) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else {
            print(":( -> viewModel not intialized")
            return}
        bind(viewModel: viewModel )
    }
    func bind(viewModel : T){
        fatalError("please override binding function")
    }
    
    
}
