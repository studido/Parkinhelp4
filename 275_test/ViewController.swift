//
//  ViewController.swift
//  275_test
//
//  Created by Sterling Smith on 10/29/19.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var WelcomeLabel: UILabel!
    @IBOutlet weak var GoogleSignIn: UIButton!
    @IBOutlet weak var FacebookSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FacebookSignIn.layer.cornerRadius = 10
        self.GoogleSignIn.layer.cornerRadius = 10
        self.WelcomeLabel.layer.cornerRadius = 10
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.signInSilently()
        
        let gSignIn = GIDSignInButton(frame: CGRect(x: 0, y:0, width: 230, height:48))
        gSignIn.center = view.center
        view.addSubview(gSignIn)
        
    }


}


