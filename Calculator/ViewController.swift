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

    @IBAction func mathematicalOperation(_ sender: Any) {
    }
    
    @IBAction func digit(_ sender: UIButton) {
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

