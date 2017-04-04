//
//  GraphViewController.swift
//  Calculator
//
//  Created by Will Devon-Sand on 4/3/17.
//  Copyright © 2017 Will Devon-Sand. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    @IBOutlet weak var graphView: GraphView!{
        didSet{
            graphView.addGestureRecognizer(UIPinchGestureRecognizer (target: graphView, action: #selector(graphView.changeScale(recognizer:))))
            graphView.addGestureRecognizer(UITapGestureRecognizer (target: graphView, action: #selector(graphView.moveOrigin(recognizer:))))
        }
    }
    
    private var brain = CalculatorBrain(){
        didSet{
            updateUI()
        }
    }
    private func updateUI(){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
