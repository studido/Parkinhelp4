//
//  deleteEventViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-30.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit
import FirebaseDatabase

class deleteEventViewController: UIViewController {
    @IBOutlet weak var dayDelete: UITextField!
    
    @IBOutlet weak var timeDelete: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayDelete.delegate = self//enable keyboard to hide after click return
        timeDelete.delegate = self//enable keyboard to hide after click return
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func confirmDelete(_ sender: Any) {
        /*dayDelete.text!
        timeDelete.text!*/
        
        //Check dayOfWeekInput is valid
        if checkValidDayOfWeek(dayOfTheWeek: dayDelete.text!) == false {
            let invalidDayAlert = UIAlertController(title: "Invalid day of the week", message: "(Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday)", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            invalidDayAlert.addAction(okButton)
            self.present(invalidDayAlert, animated: true, completion: nil)
            return
        }
        //Check if timeInput is valid
        if checkValidTime(time: timeDelete.text!) == false {
            let invalidTimeAlert = UIAlertController(title: "Invalid time format", message: "1-12:0-59 AM/PM", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
            invalidTimeAlert.addAction(okButton)
            self.present(invalidTimeAlert, animated: true, completion: nil)
            return
        }
        
        deleteEvent(time: timeDelete.text!, day: dayDelete.text!, completion: {medDict in
            if (medDict == ["-1" : "-1"]) {
                let invalidAlert = UIAlertController(title: "Invalid event", message: "No event found at the given time of the day", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in
                    //Do nothing
                })
                invalidAlert.addAction(okButton)
                self.present(invalidAlert, animated: true, completion: nil)
            } else {
                
                let successAlert = UIAlertController(title: "Event deleted, click Back to leave this page", message: "", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in
                    /*self.performSegue(withIdentifier: "jumpBackM2", sender: self)//jump back to MedicationMainVC after click button Confirm*/
                })
                successAlert.addAction(okButton)
                self.present(successAlert, animated: true, completion: nil)
            }
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

extension deleteEventViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        textField.resignFirstResponder()
        return true
    }
}
