//
//  ArcView.swift
//  Robotics
//
//  Created by Erk EKİN on 19/12/15.
//  Copyright © 2015 erkekin. All rights reserved.
//

import Foundation
import UIKit

class ArcView:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.anchorPoint = CGPointMake(0, 0.5);
        let link = drawPoint(CGPointMake(0,10), color: UIColor.blackColor().CGColor)
        layer.addSublayer(link)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.anchorPoint = CGPointMake(0, 0.5);
        
    }
    func drawPoint(point:CGPoint, color:CGColor) -> CAShapeLayer{
        
        let layer = CAShapeLayer()
        let radius:CGFloat = 20
        layer.path = UIBezierPath(roundedRect: CGRect(x: point.x - radius, y: point.y - radius, width: radius*2, height: radius*2), cornerRadius: radius).CGPath
        layer.fillColor = color
        return layer
        
    }
}