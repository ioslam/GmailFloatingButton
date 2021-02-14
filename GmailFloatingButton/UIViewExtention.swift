//
//  UIViewExtention.swift
//  New_Gen
//
//  Created by OSX on 6/26/18.
//  Copyright © 2018 Minds. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundUIView: UIView {
    
    @IBInspectable var border_Color: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = border_Color.cgColor
        }
    }
    
    @IBInspectable var border_Width: CGFloat = 2.0 {
        didSet {
            //self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var corner_Radius: CGFloat = 0.0 {
        didSet {
            //self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = true
        }
    }
    @IBInspectable var show_Shadow : Int = 0{
        
        didSet{
            if(show_Shadow == 1){
                self.dropShadow(color: .black, opacity: 0.5, offSet: CGSize(width: -1, height: 5), radius: 10, scale: true)
            }
        }
    }
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = true
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    @IBInspectable var circular : Bool = true {
        didSet {
            
            self.layer.cornerRadius = (self.frame.size.height/2)
            
            self.clipsToBounds = true
            
        }
    }
    
    
    @IBInspectable var drowShadow: Bool = true {
        didSet {
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOpacity = 0.08
            
            //self.layer.shadowOffset = CGSize.zero
            self.layer.shadowRadius = 3
            self.layer.shadowOffset = CGSize(width:1.0,height: 1.0)
            self.layer.cornerRadius = 10
            self.clipsToBounds = true
        }
    }
    
}

extension UIView{
    func makeThatShadow() {
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
    }
    
    //MARK:- Shimmer Loading Animation
    func startShimmeringViewAnimation() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        // Color One is the base , color two is the color whice animating..
        let gradientColorOne = UIColor(white: 0.90, alpha: 1.0).cgColor
        let gradientColorTwo = UIColor(white: 0.95, alpha: 1.0).cgColor
        gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        self.layer.addSublayer(gradientLayer)
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        // we can modify the speed of the shimmer animating..
        animation.duration = 1.25
        gradientLayer.add(animation, forKey: animation.keyPath)
    }
    func removeGradientLayer() {
        self.layer.sublayers = self.layer.sublayers?.filter { theLayer in
            !theLayer.isKind(of: CAGradientLayer.classForCoder())
        }
    }
    
}
