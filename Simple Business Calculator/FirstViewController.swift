//
//  FirstViewController.swift
//  Simple Business Calculator
//
//  Created by Jacobo on 10/26/17.
//  Copyright © 2017 Jacobo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false // will be true when performing math
    var operation = 0
    
    @IBOutlet weak var calcDisplay: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true  {//  When user types new number we check if we are performing math
            calcDisplay.text = String(sender.tag-1)
            numberOnScreen = Double(calcDisplay.text!)!
            performingMath = false
        } else {
            calcDisplay.text = calcDisplay.text! + String(sender.tag-1)
            numberOnScreen = Double(calcDisplay.text!)!
        }
       
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if calcDisplay.text != "" && sender.tag != 11 && sender.tag != 16 // checking that operation is not empty or using c or equal buttons
        {
            previousNumber = Double(calcDisplay.text!)!
            if sender.tag == 12 { // Divide
                calcDisplay.text = "/"
            }
            else if sender.tag == 13 { // Multiple
                calcDisplay.text = "x"
            }
            else if sender.tag == 14 { //Minus
                calcDisplay.text = "-"
            }
            else if sender.tag == 15 { // Plus
                operation = sender.tag
                calcDisplay.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16 { // check if equal and perform math..
            if operation  == 12 { // Divide
                calcDisplay.text = String(previousNumber / numberOnScreen)
            }
            else if operation  == 13 { // Multiply
                calcDisplay.text = String(previousNumber * numberOnScreen)
            }
            else if operation  == 14 { // Minus
                calcDisplay.text = String(previousNumber - numberOnScreen)
            }
            else  if operation  == 15 { // Plus
                calcDisplay.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11 {
            calcDisplay.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

