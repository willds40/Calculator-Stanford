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
    
    override func draw(_ rect: CGRect) {
        let graphOrigin = CGPoint(x:bounds.midX, y: bounds.midY)
        let axixDrawer:AxesDrawer = AxesDrawer()
        axixDrawer.drawAxes(in: rect, origin: graphOrigin, pointsPerUnit: CGFloat(scale))
        
        func changeScale(recognizer: UIPinchGestureRecognizer){
            switch recognizer.state{
            case.changed,.ended:
                scale *= recognizer.scale
                recognizer.scale = 1.0
            default: break
            }
        }
    }
    
    
}
