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
    var digit = " "
    var mathematicalSymbol = " "
    
    
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
        mathematicalSymbol = sender.currentTitle!
                brain.preformOperation(mathematicalSymbol:mathematicalSymbol)
            displayValue = brain.result

            }
    func clear()->String{
        return " "
    }
    
    @IBAction func PrintDescription(_ sender: UIButton) {
            display.text! = clear()
            display.text! = brain.printDescription(oper1: digit, symbol: mathematicalSymbol, secondOperand: "", result: brain.result)
        
    }
    @IBAction private func digit(_ sender: UIButton) {
         digit = sender.currentTitle!
        if currentUserIsTyping{
            let currentDisplayText = display.text!
            display.text! = currentDisplayText + digit
            digit = currentDisplayText + digit
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

