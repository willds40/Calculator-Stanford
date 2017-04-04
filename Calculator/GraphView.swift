//
//  GraphView.swift
//  Calculator
//
//  Created by Will Devon-Sand on 4/3/17.
//  Copyright © 2017 Will Devon-Sand. All rights reserved.
//

import UIKit
@IBDesignable
class GraphView: UIView {
    
    @IBInspectable
    var scale: CGFloat = 0.90{didSet{setNeedsDisplay()}}
    
    var graphOrigin: CGPoint{
       return CGPoint(x:bounds.midX, y: bounds.midY)}
    
    func changeScale(recognizer: UIPinchGestureRecognizer){
        switch recognizer.state{
        case.changed,.ended:
            scale *= recognizer.scale
            recognizer.scale = 1.0
        default: break
        }
    }
    
    override func draw(_ rect: CGRect) {
               let axixDrawer:AxesDrawer = AxesDrawer()
        axixDrawer.drawAxes(in: rect, origin: graphOrigin, pointsPerUnit: CGFloat(scale))
    }
    
    
}
