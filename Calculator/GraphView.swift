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
    var scale = 1.0
    
    override func draw(_ rect: CGRect) {
        let graphOrigin = CGPoint(x:bounds.midX, y: bounds.midY)
        let axixDrawer:AxesDrawer = AxesDrawer()
        axixDrawer.drawAxes(in: rect, origin: graphOrigin, pointsPerUnit: CGFloat(scale))
        
        
        
    }
    
    
}
