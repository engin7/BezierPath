//
//  ViewController.swift
//  BezierPath
//
//  Created by Engin KUK on 17.01.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
        let width: CGFloat = 240.0
        let height: CGFloat = 160.0
     
        let demoView = DemoView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                              y: self.view.frame.size.height/2 - height/2,
                                              width: width,
                                              height: height))
        self.view.addSubview(demoView)
    }
}

