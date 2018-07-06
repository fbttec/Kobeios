//
//  ViewController.swift
//  Kobeios
//
//  Created by rodrigo.freitas.leite@gmail.com on 08/31/2017.
//  Copyright (c) 2017 rodrigo.freitas.leite@gmail.com. All rights reserved.
//

import UIKit
import Kobeios


class ViewController: UIViewController, Stringable {
    
    @IBOutlet weak var txtField: TextfieldLabeled!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTouch(_ sender: Any) {
        txtField.showLabel( txtField.labelHidden)
    }
    
}
