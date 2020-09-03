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
    
    let buttonProps = ASBTextProps(UIFont.systemFont(ofSize: 15), UIColor.red, nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        button
            .setTintColor(.clear)
            .setBordeColor(.black)
            .setParam("Update", UIImage(named: "submit-button"), .scaleToFill, { (index, title) in print("index: \(index) title: \(title)") })
            .setBackgroundColor(UIColor.gray)
            .setProps("Update", buttonProps, .scaleToFill, {(index, title) in print("Submit...") })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

