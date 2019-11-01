//
//  ViewController.swift
//  275_test
//
//  Created by Sterling Smith on 10/29/19.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var WelcomeMessage: UILabel!
    @IBOutlet weak var ParkinHelpIcon: UIImageView!
    @IBOutlet weak var WelcomeLabel: UILabel!
    @IBOutlet weak var GoogleSignIn: UIButton!
    @IBOutlet weak var FacebookSignIn: UIButton!
    @IBOutlet weak var TeamDancingDragon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FacebookSignIn.layer.cornerRadius = 10
        FacebookSignIn.layer.borderColor = UIColor.blue.cgColor
        FacebookSignIn.layer.borderWidth = 1
        self.GoogleSignIn.layer.cornerRadius = 10
        GoogleSignIn.layer.borderWidth = 1
        GoogleSignIn.layer.borderColor = UIColor.blue.cgColor
        ParkinHelpIcon.layer.cornerRadius = 30
        ParkinHelpIcon.layer.borderColor = UIColor.blue.cgColor
        ParkinHelpIcon.layer.borderWidth = 4
        WelcomeLabel.layer.cornerRadius = 30
    
        // Do any additional setup after loading the view, typically from a nib.
    }


}


