//
//  GraphViewController.swift
//  Calculator
//
//  Created by Will Devon-Sand on 4/3/17.
//  Copyright © 2017 Will Devon-Sand. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController {

    
    
    @IBOutlet weak var graphView: UIView!
   
    private var brain = CalculatorBrain(){
        didSet{
            updateUI()
        }
    }
    private func updateUI(){
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
    

}
