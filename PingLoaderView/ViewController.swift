//
//  ViewController.swift
//  PingLoaderView
//
//  Created by Jeff Eom on 2016-08-09.
//  Copyright © 2016 Jeff Eom. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoadingViewDelegate {
    
    var loadingView = LoadingView(frame: CGRectZero)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        addLoadingView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLoadingView() {
        let boxSize: CGFloat = 100
        loadingView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        loadingView.parentFrame = view.frame
        loadingView.delegate = self
        view.addSubview(loadingView)
        loadingView.addDot1()
    }
    
    func animateLabel() {
        loadingView.removeFromSuperview()
        view.backgroundColor = UIColor.blueColor()
        
        let label: UILabel = UILabel(frame: view.frame)
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 170.0)
        label.textAlignment = NSTextAlignment.Center
        label.text = "PING"
        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
        view.addSubview(label)
    }

}

