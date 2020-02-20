//
//  BarController.swift
//  ProjektSwift
//
//  Created by Student140 on 27/11/2019.
//  Copyright © 2019 Student140 PWR. All rights reserved.
//

import UIKit

class BarController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = view.center
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center ,radius: 100 ,startAngle: 0 ,endAngle: 2*CGFloat.pi,clockwise: true)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        // Do any additional setup after loading the view.
        
        view.layer.addSublayer(shapeLayer)
    }
    
}

/*
let center = view.center
let shapeLayer = CAShapeLayer()
let circularPath = UIBezierPath(arcCenter: center ,radius: 100 ,startAngle: 0 ,endAngle: 2*CGFloat.pi,clockwise: true)

shapeLayer.path = circularPath.cgPath
shapeLayer.strokeColor = UIColor.red.cgColor
shapeLayer.lineWidth = 10
// Do any additional setup after loading the view.

view.layer.addSublayer(shapeLayer)
*/
