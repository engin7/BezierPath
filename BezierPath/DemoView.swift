//
//  DemoView.swift
//  BezierPath
//
//  Created by Engin KUK on 17.01.2021.
//

import UIKit

class DemoView: UIView {

    var path: UIBezierPath!
     
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.backgroundColor = UIColor.darkGray
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // will provide a context for the path:
    override func draw(_ rect: CGRect) {
        self.createRectangle()
        
        // Specify the fill color and apply it to the path.
          UIColor.orange.setFill()
          path.fill()
       
          // Specify a border (stroke) color.
          UIColor.purple.setStroke()
          path.stroke()
        
    }
    
    func createRectangle() {
        // Initialize the path.
        path = UIBezierPath()
     
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
     
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
     
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
     
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
     
        // Close the path. This will create the last line automatically.
        path.close()
    }
    
    
}
