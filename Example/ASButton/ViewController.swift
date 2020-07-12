//
//  ViewController.swift
//  ASButton
//
//  Created by amitpstu1@gmail.com on 07/12/2020.
//  Copyright (c) 2020 amitpstu1@gmail.com. All rights reserved.
//

import UIKit
import ASButton

class ViewController: UIViewController {
    
    @IBOutlet weak var button: ASButtonStyleClassic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button
            .setTintColor(.clear)
            .setBordeColor(.black) 
            .setParam("Update", UIImage(named: "submit-button"), .scaleToFill, { (index, title) in print("index: \(index) title: \(title)") })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

