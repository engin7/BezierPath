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
     
        createTextLayer()
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Creating Shape Layers

    // draw(_:) method in an UIView subclass provides a context for the bezier path that will be drawn. However, it’s not always necessary to override that method to perform custom drawing, and actually, you should avoid it if possible, as it has impact to the performance.
    // using CAShapeLayer objects, which are rendered much faster and you have additional flexibility by using them.
    
    func simpleShapeLayer() {
        self.createRectangle() // setting path variable we created.
     
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        self.layer.addSublayer(shapeLayer)
    }
     
    // this is how the mask works. Any part of the view that is not a part of the path is clipped, and the view actually takes the shape of the shape layer that is applied as a mask. Furthermore, properties like the fill colour have no effect when the new layer is a mask, so if we want to change the colour of the triangle we need to update the background colour of the view
    func maskTriangle() {
        self.createTriangle()
     
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        
        self.layer.mask = shapeLayer
    }
    
    func twoShapes() {
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
        
        shapeLayer2.position = CGPoint(x: 0.0, y: height)

    }
    
    func complexShape() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width/2 - 50.0, y: 0.0))
        path.addArc(withCenter: CGPoint(x: self.frame.size.width/2 - 25.0, y: 25.0),
                    radius: 25.0,
                    startAngle: CGFloat(180.0).toRadians(),
                    endAngle: CGFloat(0.0).toRadians(),
                    clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width - 50.0, y: 0.0))
        path.addCurve(to: CGPoint(x: self.frame.size.width, y: 50.0),
                      controlPoint1: CGPoint(x: self.frame.size.width + 50.0, y: 25.0),
                      controlPoint2: CGPoint(x: self.frame.size.width - 150.0, y: 50.0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath

        self.backgroundColor = UIColor.orange
        self.layer.mask = shapeLayer
    }
    
     
    func createTextLayer() {
        let textLayer = CATextLayer()
        textLayer.string = "WOW!\nThis is text on a layer!"
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.font = UIFont(name: "Avenir", size: 15.0)
        textLayer.fontSize = 15.0
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.backgroundColor = UIColor.orange.cgColor
        textLayer.frame = CGRect(x: 0.0, y: self.frame.size.height/2 - 20.0, width: self.frame.size.width, height: 40.0)
        textLayer.contentsScale = UIScreen.main.scale
        self.layer.addSublayer(textLayer)
    }
    
    // MARK: - Creating Paths
    
    func createTriangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height)) // left corner
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height)) //right corner
        path.close()
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

 
extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(.pi / 180.0)
    }
}
