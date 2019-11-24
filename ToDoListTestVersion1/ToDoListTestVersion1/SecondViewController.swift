//
//  SecondViewController.swift
//  ToDoListTestVersion1
//
//  Created by MICHAEL on 2019-11-24.
//  Copyright © 2019 MICHAEL. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    
    
    @IBAction func addItem(_ sender: Any) {
        
        if (input.text != "" )
        {
            
           list.append(input.text!)
           input.text = ""
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

