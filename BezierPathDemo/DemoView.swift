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
       //  createCAShape()
        twoShapes()
        self.backgroundColor = UIColor.blue
        
      
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
        
        //self.layer.addSublayer(shapeLayer)
        self.backgroundColor = UIColor.green
        self.layer.mask = shapeLayer
        
    }
    
    func twoShapes() {
        
        self.createRectange()
        let width: CGFloat = self.frame.size.width/2
        let height: CGFloat = self.frame.size.height/2
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: width/2, y: 0.0))
        path1.addLine(to: CGPoint(x: 0.0, y: height))
        path1.addLine(to: CGPoint(x: width, y: height))
        path1.close()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: width/2, y: height))
        path2.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: width, y: 0.0))
        path2.close()
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = UIColor.yellow.cgColor
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.green.cgColor
        
        shapeLayer2.position = CGPoint(x: width/2, y: height)
        shapeLayer1.position = CGPoint(x: width/2, y: 0)
        
        shapeLayer1.bounds.origin = CGPoint(x: -20.0, y: -40.0)
        shapeLayer1.bounds.size = CGSize(width: 200.0, height: 150.0)
        shapeLayer1.backgroundColor = UIColor.magenta.cgColor
        
        self.layer.addSublayer(shapeLayer1)
        self.layer.addSublayer(shapeLayer2)    
    }
    
    
    func twoInsideOutTrianlges() {
        
        self.createRectange()
        let width: CGFloat = self.frame.size.width/2
        let height: CGFloat = self.frame.size.height/2
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: width/2, y: 0.0))
        path1.addLine(to: CGPoint(x: 0.0, y: height))
        path1.addLine(to: CGPoint(x: width, y: height))
        path1.close()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: width/2, y: height))
        path2.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: width, y: 0.0))
        path2.close()
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = UIColor.yellow.cgColor
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.green.cgColor
        
        self.layer.addSublayer(shapeLayer1)
        self.layer.addSublayer(shapeLayer2)
    }


}


extension CGFloat
{
    func toRadian() -> CGFloat
    {
        return self * CGFloat (Double.pi)/180.0
    }
    
}
