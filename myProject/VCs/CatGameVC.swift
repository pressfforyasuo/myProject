//
//  CatGameVC.swift
//  myProject
//
//  Created by work on 13.08.2022.
//

import UIKit

class CatGameVC: UIViewController {
    
    private let buttonBack = UIButton()
    
    private let myButton = UIButton()
    
    private let side: CGFloat = 40

    override func viewDidLoad() {
        super.viewDidLoad()

        createCircleButton()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(buttonAction))
        
        self.myButton.addGestureRecognizer(recognizer)
    }
    
    @IBAction func buttonAction() {
        createCircleButton()
        
        self.view.addSubview(myButton)
    }
    
    private func createCircleButton() {
        let randX = CGFloat.random(in: 0...self.view.frame.size.width)
        let randY = CGFloat.random(in: 0...self.view.frame.size.height)
        
        if canCreateView(x: randX, y: randY) {
            myButton.frame = CGRect(x: randX, y: randY, width: self.side, height: self.side)
            myButton.backgroundColor = Functions.randomColor()
            myButton.layer.cornerRadius = myButton.frame.width/2
            myButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        } else {
            self.createCircleButton()
        }
        self.view.addSubview(myButton)
    }
    
    private func canCreateView(x: CGFloat, y: CGFloat) -> Bool {
        if x + self.side > self.view.frame.size.width {return false}
        if y + self.side > self.view.frame.size.height {return false}
        
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buttonBack.frame = CGRect(x: 20, y: 40, width: 40, height: 40)
        
        
        buttonBack.setTitle("Back", for: .normal)
        
        buttonBack.setTitleColor(.blue, for: .normal)
        
        self.view.addSubview(buttonBack)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(backToRoot))
        
        self.buttonBack.addGestureRecognizer(recognizer)
    }
    
    @IBAction func backToRoot() {
        self.navigationController?.popToRootViewController(animated: true)
    }
   
}
