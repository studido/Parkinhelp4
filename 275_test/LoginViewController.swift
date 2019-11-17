//
//  ViewController.swift
//  275_test
//
//  Created by Sterling Smith on 10/29/19.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//
// Implemented by Evan Lee and Sterling Smith


import UIKit
import GoogleSignIn
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    let FBManager = FirebaseManager()
    fileprivate var loggedIn = false
    
    @IBOutlet weak var Background: UIImageView!
    
    @IBOutlet weak var Frame: UIImageView!
    
    @IBOutlet weak var AppIcon: UIImageView!
    
    @IBOutlet weak var WelcomeMessage: UILabel!
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    
    @IBOutlet weak var GoogleSignIn: UIButton!
    @IBOutlet weak var TeamDancingDragon: UILabel!
    
    //    @IBOutlet weak var gSignIn: GIDSignInButton!
    
    //    @IBAction func googleLoginButtonPressed(_sender: Any) {
    //        GIDSignIn.sharedInstance()?.signIn()
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
        FBManager.initialze()
        
        AppIcon.layer.cornerRadius = 85
        
        //FacebookSignIn.layer.borderColor = UIColor.blue.cgColor
        //FacebookSignIn.layer.borderWidth = 1
        GoogleSignIn.layer.cornerRadius = 25
        
        WelcomeLabel.layer.cornerRadius = 30
        GoogleSignIn.addTarget(self, action: #selector(signinUserUsingGoogle(_sender:)), for: .touchUpInside)
        
        GIDSignIn.sharedInstance()?.signInSilently()
        
    }
    
    //Call google sign in when user clicks on google sign in button
    @objc func signinUserUsingGoogle(_sender: UIButton) {
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance()?.signIn()
        //handleSignInFlow()
    }
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            //Authenticate with firebase
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if error != nil {
                    print("Authentication failed with firebase")
                    return
                }
                else if error == nil {
                    print("User successfully signed in with uid: ", Firebase.Auth.auth().currentUser!)
                    let ref : DatabaseReference = Database.database().reference()
                    ref.child("Users").child(Firebase.Auth.auth().currentUser!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                        if (snapshot.exists()) {
                            //User exists in database
                            let value = snapshot.value as! [String: String]
                            
                            //Initalize users name
                            Variables.firstname = value["firstName"]!
                            Variables.lastname = value["lastName"]!
                            
                            //Route user to appropriate main menu
                            if (value["userType"] != "patient") {
                                Variables.docprofession = value["doctorProfession"]!
                                self.performSegue(withIdentifier: "goToDocMainMenu", sender: self)
                            }
                            else if (value["userType"] == "patient") {
                                Variables.age = value["age"]!
                                Variables.height = value["height"]!
                                Variables.weight = value["weight"]!
                                Variables.gender = value["gender"]!
                                Variables.contactnumber = value["contactNumber"]!
                                Variables.dateofbirth = value["dateOfBirth"]!
                                Variables.durationofdisease = value["durationOfDisease"]!
                                Variables.repetitions = value["repetitions"]!
                                Variables.intensity = value["intensity"]!
                                self.performSegue(withIdentifier: "goToMainMenu", sender: self)
                            }
                        }
                        else {
                            //First time login, route to first login questions
                            self.performSegue(withIdentifier: "goToPatientDoctorScreen", sender: self)
                        }
                    })
                }
            }
        }
        else {
        }
    }
    
    func handleSignInFlow() {
        if (loggedIn) {
            let f = Firebase.Auth.auth().currentUser
            if ((f) != nil) {
                print("The current user has an uid of :", f!.uid)
            }
            // User is signed in
            UserDefaults.standard.set(true, forKey: "usersignedIn")
            UserDefaults.standard.synchronize()
            print("Signed in with firebase")
            // Perform any operations on signed in user here.
            //let userId = user.userID                  // For client-side use only!
            //        let idToken = user.authentication.idToken // Safe to send to the server
            //        let fullName = user.profile.name
            //        let givenName = user.profile.givenName
            //        let familyName = user.profile.familyName
            //        let email = user.profile.email
            //print("Signed in successfully with google user id", userId!)
            //self.FBManager.saveScore()
            self.performSegue(withIdentifier: "goToPatientDoctorScreen", sender: self)
        } else {
            return
        }
    }
}

