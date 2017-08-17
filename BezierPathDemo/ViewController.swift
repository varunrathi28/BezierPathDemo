//
//  ViewController.swift
//  BezierPathDemo
//
//  Created by Varun Rathi on 17/08/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width:CGFloat = 240.0
        let height:CGFloat = 160.0
        
        let demoView = DemoView(frame: CGRect(x: self.view.frame.size.width/2 - width/2, y:  self.view.frame.size.height/2 - height/2, width: width, height: height))
        self.view.addSubview(demoView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

