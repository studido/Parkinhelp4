//
//  ViewController.swift
//  Survey
//
//  Created by MICHAEL on 2019-11-04.
//  Copyright © 2019 MICHAEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    
    @IBAction func Done(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirstName.delegate = self
        Height.delegate = self
        DateofBirth.delegate = self
        Weight.delegate = self
        
        Gender.delegate = self
        Age.delegate = self
        LastName.delegate = self
        ContactNumber.delegate = self
        
        DurationofDisease.delegate = self
        ContactName.delegate = self
        EmergencyCNumber.delegate = self
        ContactRelation.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
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



