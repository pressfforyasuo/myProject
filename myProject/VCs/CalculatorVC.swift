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
    private var pointIsStay = false
    private var firstOperand: Double = 0
    private var secondOperand: Double = 0
    private var currentInput: Double {
        get {
            return Double(result.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            
            if valueArray[0] == "0" {
                result.text = "\(valueArray[0])"
            } else {
                result.text = "\(newValue)"
            }
            
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
        pointIsStay = false
    }
    
    @IBAction func equivalentButton(sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        pointIsStay = false
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
    
    @IBAction func plusMinus(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func clear(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        operationSign = ""
        result.text = "0"
        stillTyping = false
        pointIsStay = false
    }
    
    @IBAction func percent(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
        stillTyping = false
        pointIsStay = false
    }
    
    @IBAction func point(_ sender: UIButton) {
        if stillTyping && !pointIsStay {
            result.text = result.text! + "."
            pointIsStay = true
        } else if !stillTyping && !pointIsStay {
            result.text = "0."
        }
    }
    //MARK: - flow funcs
    private func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
}
