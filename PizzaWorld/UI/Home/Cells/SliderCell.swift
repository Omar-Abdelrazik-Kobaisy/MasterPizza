//
//  SliderCell.swift
//  PizzaWorld
//
//  Created by Omar on 14/09/2023.
//

import UIKit

class SliderCell: UICollectionViewCell {

    
    @IBOutlet weak var rate: UILabel!
    
   @IBOutlet weak var stackView: RatingController!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stackView.numberOfStarts = {[weak self]num in
            self?.rate.text = String(num)
        }
        
    }
    
    
}
