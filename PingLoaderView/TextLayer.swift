//
//  TextLayer.swift
//  PingLoaderView
//
//  Created by Jeff Eom on 2016-08-09.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

import UIKit

class TextLayer: CATextLayer {
    override init() {
        super.init()
        
        string = "Ping"
        bounds = CGRectMake(0, 0, 100, 50)
        let bigDot = BigDotLayer()
        let center:CGPoint = CGPointMake(CGRectGetMidX(bigDot.dotPathLarge.bounds), CGRectGetMidY(bigDot.dotPathLarge.bounds))
        position = center
        font = "HelveticaNeue-Thin";
        fontSize = 25.0;
        borderColor = UIColor.clearColor().CGColor;
        borderWidth = 1;
        alignmentMode = kCAAlignmentCenter;
        contentsScale = UIScreen.mainScreen().scale
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
