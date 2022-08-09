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
    let MyCearcle = UIView()
    
    @IBOutlet weak var catGame: UIButton!
    @IBOutlet weak var Rectangle: UIButton!
    @IBOutlet weak var cearcle: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cearcleTouch(_ sender: Any) {
        Rectangle.isHidden = true
        catGame.isHidden = true
        cearcle.isHidden = true
        
        MyCearcle.frame = CGRect(x: 120, y: 322, width: 150, height: 150)
        MyCearcle.backgroundColor = .magenta
        MyCearcle.layer.cornerRadius = MyCearcle.frame.width/2
        self.view.addSubview(MyCearcle)
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
        cearcle.isHidden = true
        
        let myCG = createRectangle(count: 10)
        
        for i in 0..<myCG.count {
            self.view.addSubview(myCG[i])
        }
    }
    
    @IBAction func catGameButton(_ sender: Any) {
        
        Rectangle.isHidden = true
        catGame.isHidden = true
        cearcle.isHidden = true

        
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
