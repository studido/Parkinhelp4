//
//  addEventViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-30.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit
import FirebaseDatabase

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
        //Check dayOfWeekInput is valid
        if checkValidDayOfWeek(dayOfTheWeek: dayOfWeekInput.text!) == false {
            let invalidDayAlert = UIAlertController(title: "Invalid day of the week", message: "(Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            invalidDayAlert.addAction(okButton)
            self.present(invalidDayAlert, animated: true, completion: nil)
            return
        }
        //Check if timeInput is valid
        if checkValidTime(time: timeInput.text!) == false {
            let invalidTimeAlert = UIAlertController(title: "Invalid time format", message: "1-12:0-59 AM/PM", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            invalidTimeAlert.addAction(okButton)
            self.present(invalidTimeAlert, animated: true, completion: nil)
            return
        }
        
        
        //Check if eventInput is valid
        if (eventInput.text! == "") {
            let emptyAlert = UIAlertController(title: "Empty event", message: "Please enter an event", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            emptyAlert.addAction(okButton)
            self.present(emptyAlert, animated: true, completion: nil)
            return
        }
        
        addEvent(time: timeInput.text!, event: eventInput.text!, day: dayOfWeekInput.text!, completion: {medDict in
            let successAlert = UIAlertController(title: "Event added", message: "", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in
                self.performSegue(withIdentifier: "jumpBackM", sender: self)//jump back to MedicationMainVC after click button Confirm
            })
            successAlert.addAction(okButton)
            self.present(successAlert, animated: true, completion: nil)
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


//enable keyboard to hide after click return
extension addEventViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        textField.resignFirstResponder()
        return true
    }
}


