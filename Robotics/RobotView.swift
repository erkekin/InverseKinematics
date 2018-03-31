//
//  RobotView.swift
//  Robotics
//
//  Created by Erk EKİN on 19/12/15.
//  Copyright © 2015 erkekin. All rights reserved.
//

import UIKit
import Foundation

class RobotView: UIView {

    let gridWidth: CGFloat = 0.5
    var columns: Int = 25

    func drawPoint(point:CGPoint, color:CGColor) -> CAShapeLayer{

        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: point.x - 1, y: point.y - 1, width: 2, height: 2), cornerRadius: 1).cgPath
        layer.fillColor = color
        return layer

    }
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        CGContextSetLineWidth(context, gridWidth)
        CGContextSetStrokeColorWithColor(context, UIColor(red:0.73, green:0.84, blue:0.95, alpha:1).CGColor)

        // Calculate basic dimensions
        let columnWidth: CGFloat = self.frame.size.width / (CGFloat(self.columns) + 1.0)
        let rowHeight: CGFloat = columnWidth
        let numberOfRows: Int = Int(self.frame.size.height)/Int(rowHeight)

        // ---------------------------
        // Drawing column lines
        // ---------------------------
        for i in 1...self.columns {
            let startPoint: CGPoint = CGPoint(x: columnWidth * CGFloat(i), y: 0.0)
            let endPoint: CGPoint = CGPoint(x: startPoint.x, y: self.frame.size.height)

            CGContextMoveToPoint(context, startPoint.x, startPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
            CGContextStrokePath(context)
        }

        // ---------------------------
        // Drawing row lines
        // ---------------------------
        for j in 1...numberOfRows {
            let startPoint: CGPoint = CGPoint(x: 0.0, y: rowHeight * CGFloat(j))
            let endPoint: CGPoint = CGPoint(x: self.frame.size.width, y: startPoint.y)

            CGContextMoveToPoint(context, startPoint.x, startPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
            CGContextStrokePath(context);
        }
    }


}
