//
//  ItemDetailsViewController.swift
//  PizzaWorld
//
//  Created by Omar on 19/09/2023.
//

import UIKit
import RxSwift
import RxCocoa
class ItemDetailsViewController: BaseViewController<ItemDetailsViewModel> {

    @IBOutlet weak var ratingView: RatingView!
    
    
    @IBOutlet weak var pizzaTitle: UILabel!
    
    
    @IBOutlet weak var describtion: UILabel!
    
    
    @IBOutlet weak var pizzaOptionView: PizzaOptionsView!
    
    
    @IBOutlet weak var otherDes: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewModel?.viewDidLoad()
    }

    override func bind(viewModel: ItemDetailsViewModel) {
        viewModel.displayMainData.subscribe(onNext:{ [weak self]productViewModel in
          
                self?.pizzaTitle.text = productViewModel.title
            self?.ratingView.configureWithRating(rating: productViewModel.rating)
                self?.ratingView.rate.text = "\(productViewModel.rating)"
            self?.describtion.text = productViewModel.desc
            
        }).disposed(by: bag)
    }
    
    @IBAction func didPressAddToCart(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
