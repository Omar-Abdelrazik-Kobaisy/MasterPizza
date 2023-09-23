//
//  PizzaTextView.swift
//  PizzaWorld
//
//  Created by Omar on 23/09/2023.
//

import Foundation
class PizzaTextView : NibLoadingView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup(){
        
    }
}
