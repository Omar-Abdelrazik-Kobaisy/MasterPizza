//
//  SizesSelectorCell.swift
//  PizzaWorld
//
//  Created by Omar on 21/09/2023.
//

import UIKit

class SizesSelectorCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    
    @IBOutlet weak var checkView: UIView!
    
    @IBOutlet weak var pizzaImage: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    private let selectedColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    private let unSelectedColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCellAsUnSelected()
    }
    
    func configure(_ viewModel : SizeItemCellViewModel){
        mainLabel.text = viewModel.topString
    }
    func setCellAsUnSelected(){
        view.layer.borderColor = unSelectedColor.cgColor
        checkView.isHidden = true
        pizzaImage.image = #imageLiteral(resourceName: "PizzaUnSelected")
        mainLabel.textColor = unSelectedColor
        priceLabel.textColor = unSelectedColor
        descLabel.textColor = unSelectedColor
    }
    func setCellSelected(){
        view.layer.borderColor = selectedColor.cgColor
        checkView.isHidden = false
        pizzaImage.image = #imageLiteral(resourceName: "PizzaSelected")
        mainLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        priceLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        descLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    override var isSelected: Bool  {
        didSet{
            if(isSelected){
                setCellSelected()
            }else{
                setCellAsUnSelected()
            }
        }
    }

}
