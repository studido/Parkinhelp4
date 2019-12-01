//
//  addEventViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-30.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class addEventViewController: UIViewController {
    
    //initialize textfields
    @IBOutlet weak var dayOfWeekInput: UITextField!
    @IBOutlet weak var timeInput: UITextField!
    @IBOutlet weak var eventInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dayOfWeekInput.delegate = self//enable keyboard to hide after click return
        timeInput.delegate = self//enable keyboard to hide after click return
        eventInput.delegate = self//enable keyboard to hide after click return

        // Do any additional setup after loading the view.
    }
    
    
    //define the function of the button Confirm
    @IBAction func Confirm(_ sender: Any) {
        /*dayOfWeekInput.text!
        timeInput.text!
        eventInput.text!
         write those values back to firebase*/
        
        
        
        
        self.performSegue(withIdentifier: "jumpBackM", sender: self)//jump back to MedicationMainVC after click button Confirm
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


//enable keyboard to hide after click return
extension addEventViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        textField.resignFirstResponder()
        return true
    }
}

