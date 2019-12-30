//
//  RobotView.swift
//  Robotics
//
//  Created by Erk EKİN on 19/12/15.
//  Copyright © 2015 erkekin. All rights reserved.
//

import UIKit


class RobotView: UIView {

    let gridWidth: CGFloat = 0.5
    var columns: Int = 25

    func drawPoint(point:CGPoint, color:CGColor) -> CAShapeLayer{

        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: point.x - 1, y: point.y - 1, width: 2, height: 2), cornerRadius: 1).cgPath
        layer.fillColor = color
        return layer

    }
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(gridWidth)
        context.setStrokeColor(UIColor(red:0.73, green:0.84, blue:0.95, alpha:1).cgColor)

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
            context.move(to: startPoint)
            context.addLine(to: endPoint)
            context.strokePath()
        }

        // ---------------------------
        // Drawing row lines
        // ---------------------------
        for j in 1...numberOfRows {
            let startPoint: CGPoint = CGPoint(x: 0.0, y: rowHeight * CGFloat(j))
            let endPoint: CGPoint = CGPoint(x: self.frame.size.width, y: startPoint.y)
            context.move(to: startPoint)
            context.addLine(to: endPoint)
            context.strokePath();
        }
    }
}
