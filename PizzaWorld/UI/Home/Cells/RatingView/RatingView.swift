//
//  RatingView.swift
//  PizzaWorld
//
//  Created by Omar on 14/09/2023.
//

import Foundation
import UIKit
 class RatingView : UIView {
    //MARK: UI PRIVATE Configuration
    private let maxRatting : Int = 5
    //MARK: UI Public Confguration
    let rating : Int = 2
    lazy var stackView : UIStackView = {
       let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 2
//        stack.backgroundColor = .red
        return stack
    }()
     lazy var rate : UILabel = {
        let rateLabel = UILabel()
         rateLabel.textColor = .black
         rateLabel.textAlignment = .center
         rateLabel.layer.borderColor = UIColor.yellow.cgColor
         rateLabel.layer.borderWidth = 2
         rateLabel.layer.cornerRadius = 15
         
         return rateLabel
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
//        configureWithRating(rating: rating)
    }
    
    required init?(coder : NSCoder) {
        super.init(coder: coder) 
        setupUI()
//        configureWithRating(rating: rating)
    }
    
     func configureWithRating(rating : Int = 0,style : Style = .full){
         var image : UIImageView
         switch style
         {
         case .full:
             
             if rating > 0{
                 for rate in 1...maxRatting{
                     if(rate<=rating)
                     {
                         image = generateStarView(.filled)
                         stackView.addArrangedSubview(image)
                     }else{
                         image = generateStarView(.empty)
                         stackView.addArrangedSubview(image)
                     }
                 }
             }
         case .compact:
             image = generateStarView(.filled)
             stackView.addArrangedSubview(image)
         }
    }
    
    func setupUI(){
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor , constant: 30).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.addSubview(rate)
        rate.translatesAutoresizingMaskIntoConstraints = false
        rate.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rate.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35).isActive = true
        rate.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        rate.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func generateStarView(_ type : StarType) -> UIImageView{
        let starType :UIImage
        switch type{
        case .filled:
            starType = #imageLiteral(resourceName: "filledStar")
        case .empty:
            starType = #imageLiteral(resourceName: "star")
        }
        let starImage = UIImageView(image: starType)
        starImage.widthAnchor.constraint(lessThanOrEqualToConstant: 10).isActive = true
        return starImage
    }
    
    enum StarType{
        case filled
        case empty
    }
     enum Style {
         case full
         case compact
     }
}
