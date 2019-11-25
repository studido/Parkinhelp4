//
//  DocPatientListViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-14.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseDatabase

class DocPatientListViewController: UIViewController {

    @IBOutlet weak var DocAcc: UIButton!
    
    @IBAction func signOutUserLoggedInWithGoogle(_sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
        UserDefaults.standard.set(false, forKey: "usersignedIn")
        UserDefaults.standard.synchronize()
        print("Signed out via google")
        performSegue(withIdentifier: "goToLogin", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func getPatientData(email : String) {
        let hashedEmail = getSha256(string: email)
        let ref : DatabaseReference = Database.database().reference()
        ref.child("Emails").child(hashedEmail).observeSingleEvent(of: .value, with: { (snapshot) in
            if (snapshot.exists()) {
                let value = snapshot.value as! [String: Any]
                let patientUID = value["uid"] as? String ?? ""
                ref.child("Users").child(patientUID).observeSingleEvent(of: .value, with: { (datashot) in
                    if datashot.exists()  {
                        let patientData = datashot.value as! [String: Any]
                        // *** Can create a Patient class to store patients info, examples on how to get specific attributes are shown below
                        //Patient.firstName = ["firstName"] as? String ?? ""
                        //Patient.lasName = ["lastName"] as? String ?? ""
                        //Patient.age = ["age"] as? String ?? ""

                    }
                    else {
                        //Error - User does not exist in our database
                    }
                    
                })
            } else {
                //Error - Users email does not exist under emails
            }})

        
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
