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
    var secondOperand = " "
    var binaryOperation = false
    var firstOperand = " "
    var binaryOperationSymbol = " "
    var result = " "
    
    private var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    var brain = CalculatorBrain()

    @IBAction func clearButton(_ sender: UIButton) {
        display.text! = clearDisplay();
        }
    
    @IBAction private func mathematicalOperation(_ sender: UIButton) {
        if currentUserIsTyping{
            brain.setOperand(operand: displayValue)
            currentUserIsTyping = false
        }
        mathematicalSymbol = sender.currentTitle!
        
        if binaryOperation{
        secondOperand = digit
        }
        
        if binaryOperations.contains(mathematicalSymbol){
        binaryOperation = true
        binaryOperationSymbol = mathematicalSymbol
        firstOperand = digit;
        }
        brain.preformOperation(mathematicalSymbol:mathematicalSymbol)
        displayValue = brain.result
        
    }
    
    func clearDisplay()->String{
        return " "
    }
    
    @IBAction func PrintDescription(_ sender: UIButton) {
        display.text! = clearDisplay()
        result = String(brain.result)
        if !binaryOperation {
            display.text! = brain.printDescription(oper1: digit, symbol: mathematicalSymbol, oper2: secondOperand, result:result)
        }else{
        display.text! = brain.printDescription(oper1: firstOperand, symbol: binaryOperationSymbol, oper2: secondOperand, result: result)
        }
        
    }
    @IBAction private func digit(_ sender: UIButton) {
        digit = sender.currentTitle!
        
        if currentUserIsTyping{
            let currentDisplayText = display.text!
            display.text! = currentDisplayText + digit
            digit = currentDisplayText + digit
            firstOperand = digit
            
        }else{
            if binaryOperation{
            secondOperand = sender.currentTitle!
            }
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

