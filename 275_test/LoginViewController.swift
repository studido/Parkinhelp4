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
    fileprivate var loggedIn = false
    fileprivate let elapsed : Int = 86400 * 7 //24 hours in seconds times 7 (1 week)
    
    @IBOutlet weak var Background: UIImageView!
    
    @IBOutlet weak var Frame: UIImageView!
    
    @IBOutlet weak var AppIcon: UIImageView!
    
    @IBOutlet weak var WelcomeMessage: UILabel!
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    
    @IBOutlet weak var GoogleSignIn: UIButton!
    @IBOutlet weak var TeamDancingDragon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.signInSilently()
        GoogleSignIn.addTarget(self, action: #selector(signinUserUsingGoogle(_sender:)), for: .touchUpInside)
        
        GoogleSignIn.layer.cornerRadius = 25
        AppIcon.layer.cornerRadius = 85
        WelcomeLabel.layer.cornerRadius = 30
        
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
                    Variables.email = user.profile.email
                    let ref : DatabaseReference = Database.database().reference()
                    ref.child("Users").child(Firebase.Auth.auth().currentUser!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                        if (snapshot.exists()) {
                            //User exists in database
                            let value = snapshot.value as! [String: Any]
                            
                            //Initalize common user data
                            Variables.firstname = value["firstName"] as? String ?? ""
                            Variables.lastname = value["lastName"] as? String ?? ""
                            
                            //Route user to appropriate main menu
                            if (value["userType"]  as? String ?? "" != "patient") {
                                Variables.docprofession = value["doctorProfession"] as? String ?? ""
                                self.performSegue(withIdentifier: "goToDocMainMenu", sender: self)
                            }
                            else if (value["userType"]  as? String ?? "" == "patient") {
                                Variables.medicationId = Firebase.Auth.auth().currentUser!.uid
                                Variables.phoneId = value["doctor"] as? String ?? ""
                                Variables.age = value["age"] as? String ?? ""
                                Variables.height = value["height"] as? String ?? ""
                                Variables.weight = value["weight"] as? String ?? ""
                                Variables.gender = value["gender"] as? String ?? ""
                                Variables.contactnumber = value["contactNumber"] as? String ?? ""
                                Variables.dateofbirth = value["dateOfBirth"] as? String ?? ""
                                Variables.durationofdisease = value["durationOfDisease"] as? String ?? ""
                                Variables.repetitions = value["repetitions"] as? String ?? ""
                                Variables.intensity = value["intensity"] as? String ?? ""
                                let lastDateFilledSurvey = value["lastDateFilledSurvey"] as? String ?? ""
                                
                                let date = getDateObject(strDate: lastDateFilledSurvey)
                                
                                if (abs(Int((date.timeIntervalSinceNow))) > self.elapsed) {
                                    //perform segue to repeating surveys
                                    self.performSegue(withIdentifier: "goToWeeklySurvey", sender: self)
                                }
                                else {
                                    self.performSegue(withIdentifier: "goToMainMenu", sender: self)
                                }
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
            //Error with google/firebase authentication
        }
    }
}


//Extension function for displaying/removing spin wheel during loading/writing data
var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
