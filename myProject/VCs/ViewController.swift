//
//  ViewController.swift
//  myProject
//
//  Created by work on 09.08.2022.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func rectangleButton(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RectangleVC") as! RectangleVC
        
        self.navigationController?.pushViewController(controller, animated: true)      
    }
    
    @IBAction func catGameButton(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CatGameVC") as! CatGameVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func circleTouch(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CircleMoveVC") as! CircleMoveVC
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func calculatorButton(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "CalculatorVC") as! CalculatorVC
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
