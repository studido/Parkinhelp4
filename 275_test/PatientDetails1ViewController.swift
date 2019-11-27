//
//  PatientDetails1ViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-26.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class PatientDetails1ViewController: UIViewController {

    @IBOutlet weak var firstname: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var patientdetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
firstname.text = Variables.patientfirstname[0]
        
    lastname.text = Variables.patientlastname[0]
        email.text = Variables.patientemail[0]
        patientdetails.layer.borderWidth = 1.5
        patientdetails.layer.cornerRadius = 15
        
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
