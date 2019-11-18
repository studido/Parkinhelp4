//
//  newfootViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-17.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class newfootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func footvideo(_ sender: UIButton) {
        
        UIApplication.shared.open(URL(string:"https://www.youtube.com/watch?v=MsXlZ_phGNY")! as URL,options:[:],completionHandler: nil)
    }
    
    
    
    

}
