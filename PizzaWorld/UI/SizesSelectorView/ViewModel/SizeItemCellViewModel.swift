//
//  SizeItemCellViewModel.swift
//  PizzaWorld
//
//  Created by Omar on 21/09/2023.
//

import Foundation

class SizeItemCellViewModel{
    var topString : String
    
    init(size : Size ) {
        self.topString = size.name
    }
}
