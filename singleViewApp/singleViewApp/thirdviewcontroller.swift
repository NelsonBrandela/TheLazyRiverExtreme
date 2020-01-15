//
//  thirdviewcontroller.swift
//  singleViewApp
//
//  Created by Jean-Francois Carnovale on 2020-01-14.
//  Copyright © 2020 Jean-Francois Carnovale. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController{
    
    var backButton: UIButton
    
    init(){
        backButton = UIButton(frame:CGRect(x:0, y:200, width:100, height:50))
        backButton.setTitle("Back", for:.normal)
        super.init(nibName: nil, bundle: nil)
        backButton.addTarget(self, action: #selector(backButtonClick), for: .touchUpInside)
        self.view.addSubview(backButton)
    }
    
    required init?(coder aDecoder:NSCoder){
        backButton = UIButton()
        super.init(coder:aDecoder)
    }
    
    @objc func backButtonClick(){
        dismiss(animated: true, completion: nil)
    }
}
