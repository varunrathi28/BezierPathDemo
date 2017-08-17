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
        
       
        
        self.backgroundColor = UIColor.yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        //createRectange()
        
        createTriangle()
        
        UIColor.orange.setFill()
        path.fill()
        
        UIColor.purple.setStroke()
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
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.width))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
    


}
