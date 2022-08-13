//
//  RectangleVC.swift
//  myProject
//
//  Created by work on 13.08.2022.
//

import UIKit

class RectangleVC: UIViewController {
    
    private let buttonBack = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Functions.createView(figure: .rectangle, uiview: self.view)
        
        Functions.x = 0
        Functions.y = 0
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

