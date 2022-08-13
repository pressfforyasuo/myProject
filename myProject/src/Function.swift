//
//  Function.swift
//  myProject
//
//  Created by work on 13.08.2022.
//

import Foundation
import UIKit

enum Figure {
    case rectangle
    case circle
}

class Functions : UIViewController {
    static let MyCircle = UIView()
    
    static let side: CGFloat = 80
    static var x: CGFloat = 0
    static var y: CGFloat = 0
    
    static func randomColor() -> UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func createView(figure: Figure, uiview: UIView) {
        
        switch figure {
        case .rectangle:
            if canCreateView(uiview: uiview) {
                addView(figure: figure, uiview: uiview)
                self.x += self.side
                self.createView(figure: figure, uiview: uiview)
            } else if self.x + self.side > uiview.frame.size.width {
                self.x = 0
                self.y += self.side
                if canCreateView(uiview: uiview) {
                    self.createView(figure: figure, uiview: uiview)
                }
            }
        case .circle:
            addView(figure: figure, uiview: uiview)
        }
    }
    
    static func canCreateView(uiview: UIView) -> Bool {
        if self.x + self.side > uiview.frame.size.width {return false}
        if self.y + self.side > uiview.frame.size.height {return false}
        
        return true
    }
    
    static func addView(figure: Figure, uiview: UIView) {
        let newView = UIView()
        let x = uiview.frame.size.width/2 - self.side/2
        let y = uiview.frame.size.height/2 - self.side/2
        
        switch figure {
        case .rectangle:
            newView.frame = CGRect(x: self.x, y: self.y, width: self.side, height: self.side)
            newView.backgroundColor = Functions.randomColor()
            uiview.addSubview(newView)
        case .circle:
            self.MyCircle.frame = CGRect(x: x, y: y, width: self.side, height: self.side)
            self.MyCircle.backgroundColor = Functions.randomColor()
            self.MyCircle.layer.cornerRadius = MyCircle.frame.width/2
            uiview.addSubview(MyCircle)
        }
        
    }
}
