//
//  CartItemCell.swift
//  PizzaWorld
//
//  Created by Omar on 24/09/2023.
//

import UIKit

class CartItemCell: UITableViewCell {

    @IBOutlet weak var pizza_img: UIImageView!
    
    @IBOutlet weak var item_Label: UILabel!
    
    @IBOutlet weak var notes_Label: UILabel!
    
    @IBOutlet weak var price_Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(cart : CartItemViewModel){
        item_Label.text = "\(cart.product?.title ?? "") x \(cart.product?.quantity ?? 0)"
        notes_Label.text = cart.note
        price_Label.text = String(cart.product?.price ?? 0.0)
        notes_Label.text = cart.note
    }
    
}
