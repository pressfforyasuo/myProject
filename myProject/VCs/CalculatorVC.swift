//
//  CalculatorVC.swift
//  myProject
//
//  Created by work on 13.08.2022.
//

import UIKit

class CalculatorVC: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var result: UILabel!
    //MARK: - let/var
    private var operationSign: String = ""
    private var stillTyping = false
    private var firstOperand: Double = 0
    private var secondOperand: Double = 0
    private var currentInput: Double {
        get {
            return Double(result.text!)!
        }
        set {
            result.text = "\(newValue)"
            stillTyping = false
        }
    }
    //MARK: - lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK: - IBAction
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        let number = sender.titleLabel?.text
        
        if stillTyping {
            if (result.text?.count)! < 20 {
            result.text = result.text! + number!
            }
        } else {
            result.text = number
            stillTyping = true
        }
    }
    @IBAction func twoOperandsSignPressed(sender: UIButton) {
        if let sign = sender.titleLabel?.text {
            operationSign = sign
        }
        firstOperand = currentInput
        stillTyping = false
    }
    
    @IBAction func equivalentButton(sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        
        switch operationSign {
        case "+":
            operateWithTwoOperands {$0 + $1}
        case "-":
            operateWithTwoOperands {$0 - $1}
        case "X":
            operateWithTwoOperands {$0 * $1}
        case "/":
            operateWithTwoOperands {$0 / $1}
        default : break
        }
    }
    //MARK: - flow funcs
    private func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
}
