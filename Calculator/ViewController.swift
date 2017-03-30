//
//  ViewController.swift
//  Calculator
//
//  Created by Will Devon-Sand on 3/29/17.
//  Copyright © 2017 Will Devon-Sand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var currentUserIsTyping = false
    
    private var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    var brain = CalculatorBrain()

    @IBAction private func mathematicalOperation(_ sender: UIButton) {
        if currentUserIsTyping{
        brain.setOperand(operand: displayValue)
            currentUserIsTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle{
        brain.preformOperation(mathematicalSymbol:mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
    @IBAction private func digit(_ sender: UIButton) {
    let digit = sender.currentTitle!
        if currentUserIsTyping{
    let currentDisplayText = display.text!
    display.text! = currentDisplayText + digit
        }else{
        display.text! = digit
        }
        currentUserIsTyping = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

