//
//  ViewController.swift
//  myProject
//
//  Created by work on 09.08.2022.
//

import UIKit

class ViewController: UIViewController {

    let myButton = UIButton()
    let myView = UIView()
    let MyCircle = UIView()
    
    let buttonUp = UIButton()
    let buttonRight = UIButton()
    let buttonLeft = UIButton()
    let buttonDown = UIButton()
    
    @IBOutlet weak var catGame: UIButton!
    @IBOutlet weak var Rectangle: UIButton!
    @IBOutlet weak var circle: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func circleTouch(_ sender: Any) {
        Rectangle.isHidden = true
        catGame.isHidden = true
        circle.isHidden = true
        
        MyCircle.frame = CGRect(x: 120, y: 322, width: 150, height: 150)
        MyCircle.backgroundColor = .magenta
        MyCircle.layer.cornerRadius = MyCircle.frame.width/2
        self.view.addSubview(MyCircle)
        
        buttonUp.frame = CGRect(x: 175, y: 644, width: 30, height: 30)
        buttonUp.backgroundColor = .blue
        buttonUp.layer.cornerRadius = buttonUp.frame.width/2
        
        buttonDown.frame = CGRect(x: 175, y: 744, width: 30, height: 30)
        buttonDown.backgroundColor = .blue
        buttonDown.layer.cornerRadius = buttonUp.frame.width/2
        
        buttonLeft.frame = CGRect(x: 100, y: 690, width: 30, height: 30)
        buttonLeft.backgroundColor = .blue
        buttonLeft.layer.cornerRadius = buttonLeft.frame.width/2
        
        buttonRight.frame = CGRect(x: 250, y: 690, width: 30, height: 30)
        buttonRight.backgroundColor = .blue
        buttonRight.layer.cornerRadius = buttonRight.frame.width/2
        
        buttonUp.addTarget(self, action: #selector(buttonUpAction), for: .touchUpInside)
        buttonDown.addTarget(self, action: #selector(buttonDownAction), for: .touchUpInside)
        buttonLeft.addTarget(self, action: #selector(buttonLeftAction), for: .touchUpInside)
        buttonRight.addTarget(self, action: #selector(buttonRightAction), for: .touchUpInside)
        
        self.view.addSubview(buttonRight)
        self.view.addSubview(buttonLeft)
        self.view.addSubview(buttonDown)
        self.view.addSubview(buttonUp)
    }
    
    @objc func buttonUpAction(sender: UIButton!) {
        if MyCircle.frame.origin.y != 0 && MyCircle.frame.origin.y - 30 > 0 {
            MyCircle.frame.origin.y -= 30
        }
    }
    
    @objc func buttonDownAction(sender: UIButton!) {
        if MyCircle.frame.origin.y + 150 != 844 && MyCircle.frame.origin.y + 30 + 150 < 822 {
            MyCircle.frame.origin.y += 30
        }
    }
    
    @objc func buttonLeftAction(sender: UIButton!) {
        if MyCircle.frame.origin.x != 0 && MyCircle.frame.origin.x - 30 > 0 {
            MyCircle.frame.origin.x -= 30
        }
    }
    
    @objc func buttonRightAction(sender: UIButton!) {
        if MyCircle.frame.origin.x + 150 != 322 && MyCircle.frame.origin.x + 30 + 150 < 384 {
            MyCircle.frame.origin.x += 30
        }
    }
    
    func createRectangle(count: Int) -> [UIView] {
        var view12 = [UIView]()
        var x = 20
        var y = 0
        for i in 0..<count {
            if i % 2 == 0 && i != 0{
                y += 170
                x = 20
                
            } else if i % 2 != 0 {
                x = 190
            }
            view12.append(UIView())
            view12[i].frame = CGRect(x: x, y: y, width: 150, height: 150)
            view12[i].backgroundColor = .magenta
        }
        return view12
    }
    
    @IBAction func rectangleButton(_ sender: Any) {
        Rectangle.isHidden = true
        catGame.isHidden = true
        circle.isHidden = true
        
        let myCG = createRectangle(count: 10)
        
        for i in 0..<myCG.count {
            self.view.addSubview(myCG[i])
        }
    }
    
    @IBAction func catGameButton(_ sender: Any) {
        
        Rectangle.isHidden = true
        catGame.isHidden = true
        circle.isHidden = true

        
        var x = Int.random(in: 0...300)
        var y = Int.random(in: 0...750)
        
        let height = 100
        let width = 100
        
        while x + width > 300 {
            x = Int.random(in: 0...300)
        }
        while y + height > 750 {
            y = Int.random(in: 0...750)
        }
        
        myButton.frame = CGRect(x: x, y: y, width: width, height: height)
        myButton.backgroundColor = .magenta
        myButton.layer.cornerRadius = myButton.frame.width/2
        myButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        var x = Int.random(in: 0...300)
        var y = Int.random(in: 0...750)
        
        let height = 100
        let width = 100
        
        while x + width > 300 {
            x = Int.random(in: 0...300)
        }
        while y + height > 750 {
            y = Int.random(in: 0...750)
        }
        
        myButton.frame = CGRect(x: x, y: y, width: width, height: height)
        myButton.backgroundColor = .magenta
        myButton.layer.cornerRadius = myButton.frame.width/2
     }
}
