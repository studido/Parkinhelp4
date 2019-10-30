//
//  ViewController.swift
//  275_test
//
//  Created by Sterling Smith on 10/29/19.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WelcomeLabel: UILabel!
    @IBOutlet weak var GoogleSignIn: UIButton!
    @IBOutlet weak var FacebookSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FacebookSignIn.layer.cornerRadius = 10
        self.GoogleSignIn.layer.cornerRadius = 10
        self.WelcomeLabel.layer.cornerRadius = 10
        // Do any additional setup after loading the view, typically from a nib.
    }


}


