//
//  ArcView.swift
//  Robotics
//
//  Created by Erk EKİN on 19/12/15.
//  Copyright © 2015 erkekin. All rights reserved.
//

import UIKit

class ArcView:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        let link = draw(point: CGPoint(x: 0,y:10), color: UIColor.black.cgColor)
        layer.addSublayer(link)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        
    }
    func draw(point:CGPoint, color:CGColor) -> CAShapeLayer{
        
        let layer = CAShapeLayer()
        let radius:CGFloat = 20
        layer.path = UIBezierPath(roundedRect: CGRect(x: point.x - radius, y: point.y - radius, width: radius*2, height: radius*2), cornerRadius: radius).cgPath
        layer.fillColor = color
        return layer
        
    }
}
