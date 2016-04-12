//
//  ViewController.swift
//  CAShapeLayer
//
//  Created by 薛焱 on 16/3/11.
//  Copyright © 2016年 薛焱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = UIBezierPath(arcCenter: CGPoint(x: 150.0, y: 150.0), radius: 150, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = someView.bounds
        
        shapeLayer.strokeColor = UIColor.greenColor().CGColor // 边缘线的颜色
        shapeLayer.fillColor = UIColor.clearColor().CGColor // 闭环填充的颜色
        shapeLayer.lineCap = kCALineCapSquare // 边缘线的类型
        /*
        kCALineCapButt  平角(切掉多出的)
        
        kCALineCapRound 圆角
        
        kCALineCapSquare 平角(补齐空缺)
        */
        shapeLayer.path = path.CGPath
        shapeLayer.lineWidth = 4.0//边缘线宽度(是从边缘位置向两边延伸)
        shapeLayer.strokeStart = 0.0//起始位置0--1
        shapeLayer.strokeEnd = 0.75//结束为止0--1
        someView.layer.addSublayer(shapeLayer)
        //添加旋转动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = 1
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.repeatCount = Float(Int.max)
        shapeLayer.addAnimation(animation, forKey: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

