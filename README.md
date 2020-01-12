# InverseKinematics
Two linked Robotic arm Inverse Kinematics with Swift 5.

![regression gif](https://github.com/erkekin/InverseKinematics/blob/master/Robotics/IK.gif?raw=true)

### Formulas
I made a public [google spreadsheet](https://docs.google.com/spreadsheets/d/1__do7_nIRNFVCp-PweOyWOHdFCXpcL7w9llzjAmTFcM/edit?usp=sharing "Kinematics of 2 linked robotic arm") to show up the formula for two linked robotic arm.

### Usage 
```swift
        let baseArm = Arm(len: 200)
        let arm = Arm(len: 250)
        
        baseArm.linkedArm = arm
        
        robot = Robot(baseArm: baseArm, view:robotView) // give a robotview to the robot. to make it visible. to make it practical.
        robot[0].angle = 45.0
        robot[1].angle = 45.0
        robot.draw()
```
### Test
The code is unit tested. (more coverage appreciated.)

For any idea or contribution, please DT me.
@erkekin
