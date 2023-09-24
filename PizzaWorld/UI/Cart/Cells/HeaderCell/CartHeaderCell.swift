//
//  CartHeaderCell.swift
//  PizzaWorld
//
//  Created by Omar on 24/09/2023.
//

import UIKit

class CartHeaderCell: UITableViewCell {

    @IBOutlet weak var numberOfItems: UILabel!
    
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
