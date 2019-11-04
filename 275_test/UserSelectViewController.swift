//
//  UserSelectViewController.swift
//  275_test
//
//  Created by Sterling Smith on 10/31/19.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//
// Implemented by Evan Lee and Sterling Smith

import UIKit
import GoogleSignIn

class UserSelectViewController: UIViewController {

    @IBOutlet weak var DoctorButton: UIButton!
    @IBOutlet weak var PatientButton: UIButton!
    @IBOutlet weak var SignOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DoctorButton.layer.cornerRadius = 15
        PatientButton.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
        SignOut.addTarget(self, action: #selector(signOutUserLoggedInWithGoogle(_sender:)), for: .touchUpInside)
    }

    @objc func signOutUserLoggedInWithGoogle(_sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
        UserDefaults.standard.set(false, forKey: "usersignedIn")
        UserDefaults.standard.synchronize()
        print("Signed out via google")
        self.performSegue(withIdentifier: "goToLogin", sender: self)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
