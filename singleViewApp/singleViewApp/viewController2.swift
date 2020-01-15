//
//  viewController2.swift
//  singleViewApp
//
//  Created by Jean-Francois Carnovale on 2020-01-14.
//  Copyright © 2020 Jean-Francois Carnovale. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UIViewController{
    @IBOutlet weak var backButton: UIButton!
    
    var newButton:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.addTarget(self, action:#selector(backButtonClicked), for:.touchUpInside)
        
        newButton = UIButton(frame:CGRect(x:0, y:200, width:100, height:50))
        newButton?.setTitle("Forward", for:.normal)
        newButton?.addTarget(self, action:#selector(newButtonClicked), for:.touchUpInside)
        self.view.addSubview(newButton!)
        
    }
    
    
    @objc func newButtonClicked(){
        let thirdviewController = ThirdViewController()
        thirdviewController.view.backgroundColor = .orange
        present(thirdviewController, animated:true, completion:nil)
    }
    
    @objc func backButtonClicked(){
        dismiss(animated:true, completion:nil)
    }
}
