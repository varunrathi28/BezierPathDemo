//
//  DemoView.swift
//  BezierPathDemo
//
//  Created by Varun Rathi on 17/08/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class DemoView: UIView {

    var path:UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
         createCAShape()
        self.backgroundColor = UIColor.yellow
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        //createRectange()
        
      //  createTriangle()
        
      //  createOval()
        
     // createCircle()
        
      //  createRoundedRect()
        
     //   createArc()
        
       
        
        UIColor.orange.setFill()
        path.fill()
        
        UIColor.green.setStroke()
        path.stroke()
    }
    
    // Create Rectangle
    
    func createRectange()
    {
         path = UIBezierPath()
        
        // Move to origin
         path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        
        // Draw line to bottom left corner
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height))
        
        // Draw from bottom left to bottom right
        
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Draw from Bottom right- Top Right
        
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        
        // Draw to top left (origin)
        
        path.close()

    }
    
    // Create Triangle
    
    func createTriangle()
    {
        
        path = UIBezierPath()
        path.move(to:CGPoint(x: self.frame.size.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
    
    //Create Oval
    
    func createOval()
    {
          self.path = UIBezierPath(ovalIn: self.bounds)
    }
    
    // Circle
    
    func createCircle()
    {
        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2, y: 0.0, width: self.frame.size.height, height: self.frame.size.height))
    }
    
    // Rounded corner with specific rounding on sides [Top right, Top left, Bottom Right ,Bottom Left]
    
    func createRoundedRect()
    {
        self.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 15.0, height: 0))
    }
    
    func createArc()
    {
        self.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y:  self.frame.size.height/2), radius: self.frame.size.height/2, startAngle: CGFloat(240).toRadian(), endAngle: CGFloat(15).toRadian(), clockwise: false)
    }


    // CASHAPE
    
    func createCAShape()
    {
        self.createTriangle()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 3.0
        
        self.layer.addSublayer(shapeLayer)
        
    }


}






extension CGFloat
{
    func toRadian() -> CGFloat
    {
        return self * CGFloat (Double.pi)/180.0
    }
    
}
