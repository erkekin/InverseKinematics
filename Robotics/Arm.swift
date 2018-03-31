//
//  Arm.swift
//  IK2D
//
//  Created by Erk EKİN on 18/12/15.
//  Copyright © 2015 ekin. All rights reserved.
//

import UIKit

class Arm{

    var view:UIView = ArcView(frame: .zero)
    var lenght: Float = 0
    var angle: Float = 0 {
        didSet{
            view.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        }
    }

    var linkedArm:Arm?

    init(len: Float){
        self.lenght = len
        view.backgroundColor = .gray
    }

}
