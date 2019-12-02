//
//  PatientDetails1ViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-26.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class PatientDetails1ViewController: UIViewController {

    @IBOutlet weak var whiteback: UIImageView!
    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var patientdetails: UILabel!
    
    //Added
    @IBOutlet weak var patientFirstName: UILabel!
    @IBOutlet weak var patientLastName: UILabel!
    @IBOutlet weak var patientEmail: UILabel!
    
    @IBAction func goToPatientMedicationSchedule() {
        Variables.medicationId = Variables.patientUID[myIndex]
        self.performSegue(withIdentifier: "goToMeds", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        patientFirstName.text = Variables.patientfirstname[myIndex]
        patientLastName.text = Variables.patientlastname[myIndex]
        patientEmail.text = Variables.patientemail[myIndex]
        
//        patientFirstName.text = patientFName[myIndex]
//        patientLastName.text = patientLName[myIndex]
//        patientEmail.text = patientDescription[myIndex]
        
        /*Commented
        firstname.text = Variables.patientfirstname[0]
        lastname.text = Variables.patientlastname[0]
        email.text = Variables.patientemail[0]
        patientdetails.layer.borderWidth = 1.5
        patientdetails.layer.cornerRadius = 15
        whiteback.layer.borderWidth = 1.5
        whiteback.layer.cornerRadius = 15
        */
        
        // Do any additional setup after loading the view.
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
