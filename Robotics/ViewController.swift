//
//  ViewController.swift
//  EERegression
//
//  Created by Erk EKİN on 15/11/15.
//  Copyright © 2015 ekin. All rights reserved.
//

import UIKit

enum Dnm {
  case a
  case z
}

extension Float{
    func normaldeg() -> Float{
        return self * 180.0 / .pi

    }
    func deg() -> Float{
        let angle = self * 180.0 / .pi
        return angle < 0 ? 360.0 + angle:angle

    }
    func rad() -> Float{

        return  self * .pi / 180.0

    }
}

class ViewController: UIViewController {

    @IBOutlet weak var v1Field: UITextField!
    @IBOutlet weak var v2Field: UITextField!
    @IBOutlet weak var v1Slider: UISlider!
    @IBOutlet weak var v2Slider: UISlider!
    @IBOutlet weak var robotView:RobotView!

    var robot:Robot!
    var iteration = 0
    var timer:Timer? = Timer()

    override func viewDidAppear(_ animated: Bool) {

        let baseArm = Arm(len: 200)
        let arm = Arm(len: 250)

        baseArm.linkedArm = arm

        robot = Robot(baseArm: baseArm, view:robotView)

        let pan = UIPanGestureRecognizer(target: self, action: #selector(tapped))
        robot.view.addGestureRecognizer(pan)

        let size = robot.view.frame.size

        robot.origin.x = Float(size.width / 2)
        robot.origin.y = Float(size.height / 2)

        let width:Float = 20.0

        baseArm.view.frame = CGRect(
            x: CGFloat(robot.origin.x),
            y: size.height - CGFloat(robot.origin.y + width/2),
            width: CGFloat(baseArm.lenght),
            height: CGFloat(width))

        baseArm.linkedArm?.view.frame = CGRect(
            x: CGFloat(baseArm.lenght),
            y: 0,
            width: CGFloat((baseArm.linkedArm?.lenght)!),
            height: CGFloat(width))

        baseArm.view.addSubview((baseArm.linkedArm?.view)!)
        robot.view.addSubview(baseArm.view)

    }

    @IBAction func drawACircle(sender: AnyObject) {

        timer = .scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateAutomatedRobot), userInfo: nil, repeats: true)

        timer!.fire()
    }

    @objc func updateAutomatedRobot() {

        let circlepoints:[(Float,Float)] = robot.circlepoints.map { ($0.0 - 400, $0.1 - 100) }

        if(iteration < circlepoints.count){

            let point = circlepoints[iteration]

            let tapPositionOneFingerTap = CGPoint(x: CGFloat(point.0),y: CGFloat(point.1))
            angles(for: tapPositionOneFingerTap)


            iteration += 1

        } else{
            timer!.invalidate()
            iteration = 0
        }

    }

    @IBAction func angleChanged(_ sender: UISlider) {
        let armId = Int(sender.tag-1000)
        robot[armId].angle = sender.value.rad() * -1.0

        let tf = armId == 0 ? v1Field: v2Field

        tf?.text = "\(sender.value)"

        robot.draw()

    }

    func angles(for point:CGPoint){

        let height = robot.view.frame.size.height
        let tapPositionOneFingerTap = point
        let realY = Float(height - tapPositionOneFingerTap.y) - robot.origin.y
        let realX =  Float(tapPositionOneFingerTap.x) - robot.origin.x

        let angles = robot.inverseKinematics(coordinate: (realX, realY))

        robot[0].angle = angles.Q1 * -1.0
        robot[1].angle = angles.Q2 * -1.0

        // UI UPDATES
        v1Field.text = "\(angles.Q1.deg())"
        v2Field.text = "\(angles.Q2.deg())"

        v1Slider.setValue(angles.Q1.deg(), animated: false)
        v2Slider.setValue(angles.Q2.deg(), animated: false)

        robot.draw()
    }

    @objc func tapped(sender: UITapGestureRecognizer) {
        switch sender.state{
        case .changed:
            let tapPositionOneFingerTap = sender.location(in: robot.view)
            angles(for: tapPositionOneFingerTap)
        default:
            break
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

