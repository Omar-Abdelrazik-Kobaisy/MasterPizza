//
//  PopularCell.swift
//  PizzaWorld
//
//  Created by Omar on 16/09/2023.
//

import UIKit

class PopularCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var des: UILabel!
    
    
    @IBOutlet weak var ratingView: RatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
