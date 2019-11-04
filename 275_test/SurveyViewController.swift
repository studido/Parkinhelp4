//
//  ViewController.swift
//  Survey
//
//  Created by MICHAEL on 2019-11-04.
//  Copyright © 2019 MICHAEL. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {
    //reference the UIs, connect them with codes
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var DateofBirth: UITextField!
    @IBOutlet weak var Weight: UITextField!
    
    
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var ContactNumber: UITextField!
    
    @IBOutlet weak var DurationofDisease: UITextField!
    @IBOutlet weak var ContactName: UITextField!
    @IBOutlet weak var EmergencyCNumber: UITextField!
    @IBOutlet weak var ContactRelation: UITextField!
    
    //reference the button, connect it with codes
    @IBAction func Done(_ sender: Any) {
        //after click the button, go to MainMenu page
        let surveyView: UIStoryboard = UIStoryboard(name: "MainMenu", bundle: nil)
        let mainMenuView = surveyView.instantiateViewController(withIdentifier: "MainMenu") as! ContainerController
        self.present(mainMenuView, animated:false, completion: nil)
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
        ContactName.delegate = self as? UITextFieldDelegate
        EmergencyCNumber.delegate = self as? UITextFieldDelegate
        ContactRelation.delegate = self as? UITextFieldDelegate
        
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
        ContactName.resignFirstResponder()
        EmergencyCNumber.resignFirstResponder()
        ContactRelation.resignFirstResponder()
    }
}

extension ViewController : UITextFieldDelegate{
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool{
            textField.resignFirstResponder()
            return true
        }
}



