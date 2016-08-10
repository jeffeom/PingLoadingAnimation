//
//  PathLayer.swift
//  PingLoaderView
//
//  Created by Jeff Eom on 2016-08-09.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

import UIKit

class PathLayer: CAShapeLayer {
    
    var firstPoint: CGPoint = CGPointZero
    var secondPoint: CGPoint = CGPointZero
    
    convenience init(firstPoint: CGPoint, secondPoint: CGPoint) {
        self.init()
        
        self.firstPoint = firstPoint
        self.secondPoint = secondPoint
        
        strokeColor = UIColor.blueColor().CGColor
        lineWidth = 1.0
        lineJoin = kCALineJoinBevel
        
        let myPath: UIBezierPath = UIBezierPath()
        
        myPath.moveToPoint(firstPoint)
        myPath.addLineToPoint(secondPoint)
        myPath.closePath()
        
        path = myPath.CGPath
        
    }
    
    required override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawLine() {
        let lineAnimation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        lineAnimation.duration = 0.3
        lineAnimation.fromValue = 0.0
        lineAnimation.toValue = 1.0
        addAnimation(lineAnimation, forKey: nil)
    }
}
