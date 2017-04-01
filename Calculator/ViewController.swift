//
//  ViewController.swift
//  Calculator
//
//  Created by Will Devon-Sand on 3/29/17.
//  Copyright © 2017 Will Devon-Sand. All rights reserved.
//

import UIKit
import Foundation

class CalculatorController: UIViewController {

    private var currentUserIsTyping = false,
    binaryOperation = false, variableHasBeenUsed = false
    private var digit = " ", mathematicalSymbol = " "
    private var brain = CalculatorBrain()
    private var variableValue = 0.0
    
    private var saveProgam:CalculatorBrain.PropertyList?
    
    @IBOutlet weak var display: UILabel!
    
    private var displayValue:Double{
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    @IBAction func setVariable(_ sender: UIButton) {
       brain.setOperand(variableName: sender.currentTitle!)
        display.text = sender.currentTitle
        variableHasBeenUsed = true
}
   
    @IBAction func storeVariableValue() {
         variableValue = displayValue
        brain.variableValuesDictionary["M"] = variableValue
        saveProgam = brain.program
        display.text! = clearDisplay()
        currentUserIsTyping = false
    }
    
    @IBAction func undo() {
        display.text = display.text?.substring(to: (display.text?.index(before: (display.text?.endIndex)!))!)
            }
    
    
    @IBAction func restore() {
        if saveProgam != nil{
        brain.program = saveProgam!
        displayValue = brain.result
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        display.text! = clearDisplay();
        currentUserIsTyping = false
        reNew()
    }
    
    @IBAction private func mathematicalOperation(_ sender: UIButton) {
        mathematicalSymbol = sender.currentTitle!
        if currentUserIsTyping{
            brain.setOperand(operand: displayValue)
            currentUserIsTyping = false
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
        brain.clear()
    }
    
    @IBAction func PrintDescription(_ sender: UIButton) {
        display.text! = clearDisplay()
        brain.preformOperation(mathematicalSymbol: "")
        display.text! = brain.printDescription
        
        
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
}

