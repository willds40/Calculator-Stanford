//
//  ViewController.swift
//  Calculator
//
//  Created by Will Devon-Sand on 3/29/17.
//  Copyright © 2017 Will Devon-Sand. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {

    private var currentUserIsTyping = false, binaryOperation = false
    private var digit = " ", mathematicalSymbol = " ",secondOperand = " "
    private var firstOperand = " ", binaryOperationSymbol = " ", result = " "
    private var brain = CalculatorBrain()
    
    @IBOutlet weak var display: UILabel!
    
    private var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    private var saveProgam:CalculatorBrain.PropertyList?
    
    @IBAction func save() {
        saveProgam = brain.program
    }
    
    @IBAction func restore() {
        if saveProgam != nil{
        brain.program = saveProgam!
            displayValue = brain.result
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        display.text! = clearDisplay();
        reNew()
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
            brain.isPartailResult = true;
        }else{
            brain.isPartailResult = false
        }
        brain.preformOperation(mathematicalSymbol:mathematicalSymbol)
        displayValue = brain.result
    }
    
    private func clearDisplay()->String{
        return " "
    }
    private func reNew(){
        self.viewDidLoad()
        self.viewWillAppear(true)
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
            
        }else{
            if binaryOperation{
                secondOperand = sender.currentTitle!
            }
            display.text! = digit
        }
        currentUserIsTyping = true
    }
}

