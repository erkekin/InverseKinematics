//
//  RoboticsTests.swift
//  RoboticsTests
//
//  Created by Erk EKİN on 19/12/15.
//  Copyright © 2015 erkekin. All rights reserved.
//

import XCTest
@testable import Robotics

class RoboticsTests: XCTestCase {
    var robot:Robot!
    
    
    override func setUp() {
        super.setUp()
        
        let baseArm = Arm(len: 100)
        let arm = Arm(len: 100)
        
        baseArm.linkedArm = arm
        
        robot = Robot(baseArm: baseArm, view:RobotView())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInverseKinematics() {
        
        let inverse = robot.inverseKinematics((x:200,y:0))
        
        XCTAssert(inverse.Q1.normaldeg() == 0, " q1 0 olması lazım")
        XCTAssert(inverse.Q2.normaldeg() == 0, " q2 0 olması lazım")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            let inverse = self.robot.inverseKinematics((x:200,y:0))
            
            XCTAssert(inverse.Q1.normaldeg() == 0, " q1 0 olması lazım")
            XCTAssert(inverse.Q2.normaldeg() == 0, " q2 0 olması lazım")
            
        }
    }
    
}
