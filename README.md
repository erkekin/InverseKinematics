# InverseKinematics
Two linked Robotic arm Inverse Kinematics with Swift.

![regression gif](https://github.com/erkekin/InverseKinematics/blob/master/Robotics/IK.gif?raw=true)

### Usage 
```swift
        let baseArm = Arm(len: 200)
        let arm = Arm(len: 250)
        
        baseArm.linkedArm = arm
        
        robot = Robot(baseArm: baseArm, view:robotView)
        robot[0].angle = 45.0
        robot[1].angle = 45.0
        robot.draw()
```
### Test
The code is unit tested. (more coverage appreciated.)

For any idea or contribution, please DT me.
@erkekin
