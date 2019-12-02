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
    var patients = [String()]
    var wait = 0
    var numpatients = Int()

    @IBOutlet weak var docpatient: UIImageView!
    @IBOutlet weak var DocAcc: UIButton!

    @IBOutlet weak var patientlist: UILabel!
    
    
    @IBOutlet weak var AddPatient: UIButton!
    @IBOutlet weak var signout: UIButton!
    
    @IBAction func addPatient(_sender: UIButton) {
        let alertController = UIAlertController(title: "Add Patient", message: "", preferredStyle: .alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter patient's email"
        }
        
        let addButton = UIAlertAction(title: "Add", style: .destructive, handler: {(alert: UIAlertAction!) in
            self.showSpinner(onView: self.view)
            let textField = alertController.textFields![0]
            let email = textField.text
            let uid = Firebase.Auth.auth().currentUser!.uid
            var emailsList : [String: String]!
            if email != "" && email! != Variables.email {
                let hashedEmail = getSha256(string: email!)
                print("here0")
                let ref : DatabaseReference = Database.database().reference()
                //Check if the provided email exists in databse
                
                ref.child("Emails").child(hashedEmail).observeSingleEvent(of: .value, with: { (snapshot) in
                    print("here1")
                  print(  snapshot.key, snapshot.exists() )
                    if (snapshot.exists()) {
                        let val = snapshot.value as! [String: String]
                        let patientUID = val["uid"]!
                        //Get the list of patients linked with doctor
                        ref.child("Users").child(uid).child("patients").observeSingleEvent(of: .value, with: { (dataSnapshot) in
                            if (dataSnapshot.exists()) {
                                emailsList = (dataSnapshot.value as! [String: String])
                                if let _ = emailsList[patientUID] {
                                    //Doctor is already connected with this patient
                                    let existsAlert = UIAlertController(title: "Patient already added", message: "", preferredStyle: .alert)
                                    let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                                    existsAlert.addAction(okButton)
                                    self.removeSpinner()
                                    self.present(existsAlert, animated: true, completion: nil)
                                    return
                                }
                                else {
                                    //Add new patient to doctors patient list
                                    emailsList[patientUID] = email!
                                }

                            } else {
                                emailsList = [patientUID : email!]
                            }
                            ref.updateChildValues(["/Users/\(uid)/patients" : emailsList])
                            
                            //Update patients info with doctors email
                            ref.child("Users").child(patientUID).child("doctor").setValue(uid)
                            
                            let successAlert = UIAlertController(title: "Successfully added patient", message: "", preferredStyle: .alert)
                            let okButton = UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in
                                self.getPatientData(email: email!, patientnum: Variables.patientfirstname.count)
                                
                            })
                            successAlert.addAction(okButton)
                            self.removeSpinner()
                            self.present(successAlert, animated: true, completion: nil)
                            
                        })
                    }
                    else {
                        //User entered an unregistered email
                        print("entered unregistered email")
                         let unregisteredEmailAlert = UIAlertController(title: "Unregistered email", message: "", preferredStyle: .alert)
                        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        unregisteredEmailAlert.addAction(okButton)
                        self.removeSpinner()
                        self.present(unregisteredEmailAlert, animated: true, completion: nil)
                        
                    }
                    
                })
                
            } else {
                //User entered an empty stirng or its own email
                let emptyEmailAlert = UIAlertController(title: "Please enter a valid email address", message: "", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                emptyEmailAlert.addAction(okButton)
                self.removeSpinner()
                self.present(emptyEmailAlert, animated: true, completion: nil)
            }
            
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {(alert: UIAlertAction!) in
            print("cancel button pressed")
            
        })
        
        alertController.addAction(addButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
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
        DocAcc.layer.cornerRadius = 15
        DocAcc.layer.borderColor = UIColor.black.cgColor
        DocAcc.layer.borderWidth = 0.5
        AddPatient.layer.cornerRadius = 15
        AddPatient.layer.borderColor = UIColor.black.cgColor
        AddPatient.layer.borderWidth = 0.5
        patientlist.layer.cornerRadius = 15
        patientlist.layer.borderColor = UIColor.black.cgColor
        patientlist.layer.borderWidth = 0.5
        signout.layer.cornerRadius = 15
        signout.layer.borderColor = UIColor.black.cgColor
        signout.layer.borderWidth = 0.5
        docpatient.layer.borderWidth = 1.5
        docpatient.layer.cornerRadius = 25
//        var patientFName = ["Patient", "Patient", "Patient"]
//
//        var patientLName = ["1", "2", "3"]
//        var patientDescription = ["P1Email", "P2Email", "P3Email"]
        getListOfPatients()
        
    }
    
    
    func getListOfPatients() {
        print(Variables.patientfirstname)
        if (Variables.patientfirstname.count > 0) { return }
        let ref : DatabaseReference = Database.database().reference()
        ref.child("Users").child(Firebase.Auth.auth().currentUser!.uid).child("patients").observeSingleEvent(of: .value, with:
            {  (snapshot) in
                if (snapshot.exists()) {
                    var patientlist : [String: String]
                    patientlist = snapshot.value as! [String: String]
                    let patientemail = Array(patientlist.values)
                    self.numpatients = patientemail.count
                    Variables.numpatient = String(self.numpatients)
                    var i = 0
                    while (i < patientemail.count){
                        self.getPatientData(email: patientemail[i], patientnum: i)
                        while(self.wait != 0){}
                        self.wait = 0
                        i += 1
                    }
                }
        })
    }
    


    func getPatientData(email : String, patientnum: Int) {
        print("trying to get patients data for ", email)
        let hashedEmail = getSha256(string: email)
        let ref : DatabaseReference = Database.database().reference()
        ref.child("Emails").child(hashedEmail).observeSingleEvent(of: .value, with: { (snapshot) in
            if (snapshot.exists()) {
                let value = snapshot.value as! [String: Any]
                let patientUID = value["uid"] as? String ?? ""
                Variables.patientUID.append(patientUID)
                ref.child("Users").child(patientUID).observeSingleEvent(of: .value, with: { (datashot) in
                    if (datashot.exists())  {
                        let patientData = datashot.value as! [String: Any]
                        //self.patients[patientnum] = patientData["firstName"] as? String ?? ""
                        Variables.patientfirstname.append(patientData["firstName"] as? String ?? "")
                        Variables.patientlastname.append(patientData["lastName"] as? String ?? "")
                        Variables.patientemail.append(patientData["email"] as? String ?? "")
                    }
                    else {
                        //Error - User does not exist in our database
                    }
                    
                })
            } else {
                //Error - Users email does not exist under emails
            }
            self.wait = 1
        })

        
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
