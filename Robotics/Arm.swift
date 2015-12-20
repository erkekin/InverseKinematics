//
//  Arm.swift
//  IK2D
//
//  Created by Erk EKİN on 18/12/15.
//  Copyright © 2015 ekin. All rights reserved.
//

import Foundation
import UIKit

class Arm{
    
    var view:UIView = ArcView(frame: CGRectMake(0,0,0,0))
    var lenght: Float = 0
    var angle: Float = 0 {
        didSet{
           view.transform = CGAffineTransformMakeRotation(CGFloat(angle))
            
        }}
    
    var linkedArm:Arm?
    
    init(len: Float){
        self.lenght = len
        view.backgroundColor = UIColor.redColor()
    }
    
}
