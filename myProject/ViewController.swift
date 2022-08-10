//
//  ViewController.swift
//  myProject
//
//  Created by work on 09.08.2022.
//

import UIKit

enum Direction {
    case left
    case right
    case up
    case down
}

enum Figure {
    case rectangle
    case circle
}

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var catGame: UIButton!
    @IBOutlet weak var Rectangle: UIButton!
    @IBOutlet weak var circle: UIButton!
    
    //MARK: - let/var
    private let moveUp = UIButton()
    private let moveDown = UIButton()
    private let moveLeft = UIButton()
    private let moveRight = UIButton()
    
    private let myButton = UIButton()
    private let myView = UIView()
    private let MyCircle = UIView()
    
    private let side: CGFloat = 80
    
    private var x: CGFloat = 0
    private var y: CGFloat = 0
    
    
    
    //MARK: - lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: - IBActions
    @IBAction func rectangleButton(_ sender: Any) {
        catGame.isHidden = true
        circle.isHidden = true
        Rectangle.isHidden = true
        
        createView(figure: .rectangle)
    }
    
    @IBAction func catGameButton(_ sender: Any) {
        catGame.isHidden = true
        circle.isHidden = true
        Rectangle.isHidden = true
        
        createCircleButton()
    }
    
    @IBAction func circleTouch(_ sender: Any) {
        catGame.isHidden = true
        circle.isHidden = true
        Rectangle.isHidden = true
        
        createView(figure: .circle)
        
        createMoveButton()
    }
    
    @objc func buttonAction(sender: UIButton!) {
        createCircleButton()
    }
    
    @objc func up(sender: UIButton!) {
        move(direction: .up)
    }
    
    @objc func down(sender: UIButton!) {
        move(direction: .down)
    }
    
    @objc func left(sender: UIButton!) {
        move(direction: .left)
    }
    
    @objc func right(sender: UIButton!) {
        move(direction: .right)
    }
    //MARK: - flow funcs
    private func move(direction: Direction) {
        switch direction {
        case .left:
            if self.MyCircle.frame.origin.x - self.side > 0 {
                self.MyCircle.frame.origin.x -= self.side
            }
        case .right:
            if self.MyCircle.frame.origin.x + self.side * 2 < self.view.frame.size.width {
                self.MyCircle.frame.origin.x += self.side
            }
        case .up:
            if self.MyCircle.frame.origin.y - self.side > 0 {
                self.MyCircle.frame.origin.y -= self.side
            }
        case .down:
            if self.MyCircle.frame.origin.y + self.side * 2 < self.view.frame.size.height {
                self.MyCircle.frame.origin.y += self.side
            }
        }
    }
    private func createMoveButton() {
        let x = self.view.frame.size.width/2
        let y = self.view.frame.size.height/2
        let side: CGFloat = 40
        moveUp.frame = CGRect(x: x - side / 2, y: y - side / 2 - 100, width: side, height: side)
        moveDown.frame = CGRect(x: x - side / 2, y: y - side / 2 , width: side, height: side)
        moveLeft.frame = CGRect(x: x - side / 2 - 80, y: y - side / 2 - 55, width: side, height: side)
        moveRight.frame = CGRect(x: x - side / 2 + 80, y: y - side / 2 - 55, width: side, height: side)
        moveUp.layer.cornerRadius = moveUp.frame.width/2
        moveDown.layer.cornerRadius = moveDown.frame.width/2
        moveLeft.layer.cornerRadius = moveLeft.frame.width/2
        moveRight.layer.cornerRadius = moveRight.frame.width/2
        moveUp.backgroundColor = .red
        moveDown.backgroundColor = .blue
        moveLeft.backgroundColor = .green
        moveRight.backgroundColor = .yellow
        moveUp.setTitle("\u{2191}", for: .normal)
        moveDown.setTitle("\u{2193}", for: .normal)
        moveLeft.setTitle("\u{2190}", for: .normal)
        moveRight.setTitle("\u{2192}", for: .normal)
        moveUp.addTarget(self, action: #selector(up), for: .touchUpInside)
        moveDown.addTarget(self, action: #selector(down), for: .touchUpInside)
        moveLeft.addTarget(self, action: #selector(left), for: .touchUpInside)
        moveRight.addTarget(self, action: #selector(right), for: .touchUpInside)
        self.view.addSubview(moveUp)
        self.view.addSubview(moveDown)
        self.view.addSubview(moveLeft)
        self.view.addSubview(moveRight)
    }
    
    private func createCircleButton() {
        let randX = CGFloat.random(in: 0...self.view.frame.size.width)
        let randY = CGFloat.random(in: 0...self.view.frame.size.height)
        
        if canCreateView(x: randX, y: randY) {
            myButton.frame = CGRect(x: randX, y: randY, width: self.side, height: self.side)
            myButton.backgroundColor = randomColor()
            myButton.layer.cornerRadius = myButton.frame.width/2
            myButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        } else {
            self.createCircleButton()
        }
        self.view.addSubview(myButton)
    }
    private func createView(figure: Figure) {
        
        switch figure {
        case .rectangle:
            if canCreateView() {
                addView(figure: figure)
                self.x += self.side
                self.createView(figure: figure)
            } else if self.x + self.side > self.view.frame.size.width {
                self.x = 0
                self.y += self.side
                if canCreateView() {
                    self.createView(figure: figure)
                }
            }
        case .circle:
            addView(figure: figure)
        }
    }
    
    private func canCreateView() -> Bool {
        if self.x + self.side > self.view.frame.size.width {return false}
        if self.y + self.side > self.view.frame.size.height {return false}
        
        return true
    }
    
    private func canCreateView(x: CGFloat, y: CGFloat) -> Bool {
        if x + self.side > self.view.frame.size.width {return false}
        if y + self.side > self.view.frame.size.height {return false}
        
        return true
    }
    
    private func addView(figure: Figure) {
        let newView = UIView()
        let x = self.view.frame.size.width/2 - self.side/2
        let y = self.view.frame.size.height/2 - self.side/2
        
        switch figure {
        case .rectangle:
            newView.frame = CGRect(x: self.x, y: self.y, width: self.side, height: self.side)
            newView.backgroundColor = randomColor()
            self.view.addSubview(newView)
        case .circle:
            self.MyCircle.frame = CGRect(x: x, y: y, width: self.side, height: self.side)
            self.MyCircle.backgroundColor = randomColor()
            self.MyCircle.layer.cornerRadius = MyCircle.frame.width/2
            self.view.addSubview(MyCircle)
        }
        
    }
    
    private func randomColor() -> UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}
