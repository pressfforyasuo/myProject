//
//  CircleMoveVC.swift
//  myProject
//
//  Created by work on 13.08.2022.
//

import UIKit

class CircleMoveVC: UIViewController {
    
    private let buttonBack = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        Functions.createView(figure: .circle, uiview: self.view)
        
        let recognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        recognizerLeft.direction = .left
        
        self.view.addGestureRecognizer(recognizerLeft)
        
        let recognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        recognizerRight.direction = .right
        
        self.view.addGestureRecognizer(recognizerRight)
        
        let recognizerUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
        recognizerUp.direction = .up
        
        self.view.addGestureRecognizer(recognizerUp)
        
        let recognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
        recognizerDown.direction = .down
        
        self.view.addGestureRecognizer(recognizerDown)
    }
    
    @IBAction func swipeLeft() {
        if Functions.MyCircle.frame.origin.x - Functions.side > 0 {
            Functions.MyCircle.frame.origin.x -= Functions.side
        }
    }
    
    @IBAction func swipeRight() {
        if Functions.MyCircle.frame.origin.x + Functions.side * 2 < self.view.frame.size.width {
            Functions.MyCircle.frame.origin.x += Functions.side
        }
    }
    
    @IBAction func swipeUp() {
        if Functions.MyCircle.frame.origin.y - Functions.side > 0 {
            Functions.MyCircle.frame.origin.y -= Functions.side
        }
    }
    
    @IBAction func swipeDown() {
        if Functions.MyCircle.frame.origin.y + Functions.side * 2 < self.view.frame.size.height {
            Functions.MyCircle.frame.origin.y += Functions.side
        }
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
