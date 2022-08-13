//
//  ViewController.swift
//  myProject
//
//  Created by work on 09.08.2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: - IBActions
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
}
