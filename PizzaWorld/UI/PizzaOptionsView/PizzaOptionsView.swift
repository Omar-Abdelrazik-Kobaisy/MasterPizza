//
//  PizzaOptionsView.swift
//  PizzaWorld
//
//  Created by Omar on 23/09/2023.
//

import Foundation
import UIKit
class PizzaOptionsView : NibLoadingView{
    
    
    @IBOutlet weak var sizeSelectorView: SizesSelectorView!
    
    
    @IBOutlet weak var quantityView: QuantityView!
    
    
    
    @IBOutlet weak var descriptionView: PizzaTextView!
}
