//
//  DoctorViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-14.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class DoctorViewController: UIViewController {




 
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var Classification: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
 
         FirstName.delegate = self as? UITextFieldDelegate
         LastName.delegate = self as? UITextFieldDelegate
         Classification.delegate = self as? UITextFieldDelegate
 
   //     nameLabel.text = FirstName.text
     //   professionLabel.text = Classification.text
        
        
        
    }
    
    @IBAction func Done(_ sender: Any) {
        Variables.docname = FirstName.text!
        Variables.docprofession = Classification.text!
        performSegue(withIdentifier: "docsurveyresult", sender: self)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Classification.resignFirstResponder()
        FirstName.resignFirstResponder()
        LastName.resignFirstResponder()
     
        
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