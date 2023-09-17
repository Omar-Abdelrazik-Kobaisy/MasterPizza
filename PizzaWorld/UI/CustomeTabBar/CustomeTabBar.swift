//
//  CustomeTabBar.swift
//  PizzaWorld
//
//  Created by Omar on 17/09/2023.
//

import UIKit

class CustomeTabBar: UITabBar {

    private let waveSubLayer: CAShapeLayer = {
            let subLayer = CAShapeLayer()
            subLayer.strokeColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            subLayer.lineWidth = 2
            subLayer.fillColor = UIColor.white.cgColor
            return subLayer
        }()
    private func addShape() {
            let path = UIBezierPath.createCurve(at: self.frame.width / 2, radius: 35, on: self)
            waveSubLayer.path = path.cgPath
            self.layer.insertSublayer(waveSubLayer, at: 0)
        }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        addShape()
    }
    

}
extension UIBezierPath {
    
    class func createCurve(at center: CGFloat, radius curve: CGFloat, on tabBar: UITabBar) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: center - (curve * 1.4), y: 0))
        path.addQuadCurve(to: CGPoint(x: center - curve, y: curve / 1.4), controlPoint: CGPoint(x: center - curve - curve / 7.5, y: 0))
        path.addCurve(to: CGPoint(x: center + curve, y: curve / 1.4),
                      controlPoint1: CGPoint(x: center - curve + curve / 4, y: curve + curve / 1.4),
                      controlPoint2: CGPoint(x: center + curve - curve / 4, y: curve + curve / 1.4))
        path.addQuadCurve(to: CGPoint(x: center + (curve * 1.4), y: 0), controlPoint: CGPoint(x: center + curve + curve / 7.5, y: 0))
        path.addLine(to: CGPoint(x: tabBar.bounds.width, y: 0))
        path.addLine(to: CGPoint(x: tabBar.bounds.width, y: tabBar.bounds.height))
        path.addLine(to: CGPoint(x: 0, y: tabBar.bounds.height))
        path.close()
        return path
    }
}
