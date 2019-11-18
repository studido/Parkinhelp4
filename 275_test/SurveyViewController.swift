//
//  ViewController.swift
//  Survey
//
//  Created by MICHAEL on 2019-11-04.
//  Copyright © 2019 MICHAEL. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SurveyViewController: UIViewController {
    //reference the UIs, connect them with codes
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var DateofBirth: UITextField!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var ContactNumber: UITextField!
    @IBOutlet weak var DurationofDisease: UITextField!
    @IBOutlet weak var Repitition: UITextField!

    @IBOutlet weak var Intensity: UITextField!
    var weight1 = ""
    var age1 = ""
    
    
    //reference the button, connect it with codes
    @IBAction func Done(_ sender: Any) {
    //    self.weight1 = Weight.text!
      //  self.age1 = Age.text!
        Variables.weight = Weight.text!
        Variables.age = Age.text!
        Variables.firstname = FirstName.text!
        Variables.lastname = LastName.text!
        Variables.gender = Gender.text!
        Variables.height = Height.text!
        Variables.dateofbirth = DateofBirth.text!
        Variables.contactnumber = ContactNumber.text!
        Variables.durationofdisease = DurationofDisease.text!
        Variables.repetitions = Repitition.text!
        Variables.intensity = Intensity.text!
        UserDefaults.standard.set(Weight.text, forKey: "Weight")
        UserDefaults.standard.set(Age.text, forKey: "Age")
        UserDefaults.standard.set(FirstName.text, forKey: "FirstName")
        UserDefaults.standard.set(LastName.text, forKey: "LastName")
        UserDefaults.standard.set(Gender.text, forKey: "Gender")
        UserDefaults.standard.set(Height.text, forKey: "Height")
        UserDefaults.standard.set(DateofBirth.text, forKey: "DateofBirth")
        UserDefaults.standard.set(ContactNumber.text, forKey: "ContactNumber")
        UserDefaults.standard.set(DurationofDisease.text, forKey: "DurationofDisease")
        UserDefaults.standard.set(Repitition.text, forKey: "Repitition")
        UserDefaults.standard.set(Intensity.text, forKey: "Intensity")
        
        //Write patient data to firebase
        let ref : DatabaseReference! = Database.database().reference()
        let userData = ["firstName": Variables.firstname,
                        "lastName":  Variables.lastname,
                        "weight":  Variables.weight,
                        "age":  Variables.age,
                        "height":  Variables.height,
                        "gender":  Variables.gender,
                        "dateOfBirth":  Variables.dateofbirth,
                        "contactNumber":  Variables.contactnumber,
                        "durationOfDisease":  Variables.durationofdisease,
                        "repetitions":  Variables.repetitions,
                        "intensity":  Variables.intensity,
                        "email" : Variables.email,
                        "userType": "patient"]
        
        let uid = Firebase.Auth.auth().currentUser!.uid
        ref.updateChildValues(["/Users/\(uid)" : userData])
        performSegue(withIdentifier: "surveyresult", sender: self)
        //dont think we need any of this now
        /*
        //after click the button, go to MainMenu page
        let surveyView: UIStoryboard = UIStoryboard(name: "MainMenu", bundle: nil)
        let mainMenuView = surveyView.instantiateViewController(withIdentifier: "MainMenu") as! ContainerController
        self.present(mainMenuView, animated:false, completion: nil)
         
 */
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // let sa = segue.destination as! RecommendViewController
       // let sw = segue.destination as! RecommendViewController
       // sw.weight = self.weight1
       // sa.age = self.age1
  
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize their value
        FirstName.delegate = self as? UITextFieldDelegate
        Height.delegate = self as? UITextFieldDelegate
        DateofBirth.delegate = self as? UITextFieldDelegate
        Weight.delegate = self as? UITextFieldDelegate
        
        Gender.delegate = self as? UITextFieldDelegate
        Age.delegate = self as? UITextFieldDelegate
        LastName.delegate = self as? UITextFieldDelegate
        ContactNumber.delegate = self as? UITextFieldDelegate
        
        DurationofDisease.delegate = self as? UITextFieldDelegate
        Intensity.delegate = self as? UITextFieldDelegate
        Repitition.delegate = self as? UITextFieldDelegate
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //this function cooperates with function ViewController : UITextFieldDelegate, to allow user hide the keyboard after enter some value
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        Age.resignFirstResponder()
        Weight.resignFirstResponder()
        Gender.resignFirstResponder()
        DateofBirth.resignFirstResponder()
        
        Height.resignFirstResponder()
        FirstName.resignFirstResponder()
        LastName.resignFirstResponder()
        ContactNumber.resignFirstResponder()
        
        DurationofDisease.resignFirstResponder()
        Repitition.resignFirstResponder()
        Intensity.resignFirstResponder()
        
    }
}

extension ViewController : UITextFieldDelegate{
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool{
            textField.resignFirstResponder()
            return true
        }
}



