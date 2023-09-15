//
//  RatingView.swift
//  PizzaWorld
//
//  Created by Omar on 14/09/2023.
//

import Foundation
import UIKit
@IBDesignable class RatingView : UIView {
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
    
    required init?(coder : NSCoder) {
        super.init(coder: coder) 
        setupUI()
        configureWithRating(rating: 3)
    }
    
    func configureWithRating(rating : Int){
        var image : UIImageView
        if rating == 0{
            for rate in 1...maxRatting{
                if(rate<=rating)
                {
                    image = generateStarView(.filled)
                    stackView.addArrangedSubview(image)
                }
                image = generateStarView(.empty)
                stackView.addArrangedSubview(image)
            }
        }
    }
    
    func setupUI(){
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
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
}
