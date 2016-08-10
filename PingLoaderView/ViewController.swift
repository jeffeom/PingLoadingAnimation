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
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 150.0)
        label.textAlignment = NSTextAlignment.Center
        label.text = "PING"
        label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let widthConstraint = NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .GreaterThanOrEqual,
                                                 toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 250)
        
        let heightConstraint = NSLayoutConstraint(item: label, attribute: .Height, relatedBy: .GreaterThanOrEqual,
                                                  toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100)
        
        let xConstraint = NSLayoutConstraint(item: label, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        
        let yConstraint = NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 0.3)
        
        NSLayoutConstraint.activateConstraints([widthConstraint, heightConstraint, xConstraint, yConstraint])
    }

}

