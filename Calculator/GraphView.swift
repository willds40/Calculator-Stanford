
import UIKit
@IBDesignable
class GraphView: UIView {
    
    var originHasBeenChanged = false
    @IBInspectable
    var scale: CGFloat = 50.00{didSet{setNeedsDisplay()}}
    @IBInspectable
    var graphOrigin:CGPoint = CGPoint(x:0, y:0){didSet{setNeedsDisplay()}}
    var start:CGPoint = CGPoint(x:0, y:0){didSet{setNeedsDisplay()}}
    var end:CGPoint = CGPoint(x:0, y:0){didSet{setNeedsDisplay()}}
    var newYPoint:CGPoint = CGPoint(x:0, y:0){didSet{setNeedsDisplay()}}
    var newXPoint:CGPoint = CGPoint(x:0, y:0){didSet{setNeedsDisplay()}}
    
    func moveOrigin(recognizer: UITapGestureRecognizer){
        let touchPoint = recognizer.location(in: self)
        switch recognizer.state{
        case .ended:
            graphOrigin = touchPoint
        default: break
        }
    }
    
    func drawfunction(x:Double, y:Double){
        newXPoint.x = graphOrigin.x + CGFloat(x)
        newXPoint.y = graphOrigin.y
        newYPoint.x = graphOrigin.x
        newYPoint.y = graphOrigin.y + CGFloat(y)
    }
    
    func changeScale(recognizer: UIPinchGestureRecognizer){
        switch recognizer.state{
        case.changed,.ended:
            scale *= recognizer.scale
            recognizer.scale = 1.0
        default: break
        }
    }
    override func draw(_ rect: CGRect) {
        
        
        if !originHasBeenChanged{
            let x = CGPoint(x:newXPoint.x,y: newXPoint.y)
            let y = CGPoint(x:newYPoint.x,y:newYPoint.y)
            let path = UIBezierPath()
            path.move(to: y)
            path.addLine(to: x)
            path.close()
            
            UIColor.red.set()
            path.lineWidth = 20.0
            path.stroke()
            path.fill()
        }
        
        let axixDrawer:AxesDrawer = AxesDrawer()
        if !originHasBeenChanged {
            graphOrigin = CGPoint(x: bounds.midX, y: bounds.midY)
        }
        
        axixDrawer.drawAxes(in: rect, origin: graphOrigin, pointsPerUnit: CGFloat(scale))
        originHasBeenChanged = true
    }
    
}
