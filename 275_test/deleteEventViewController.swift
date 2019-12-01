//
//  deleteEventViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-30.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

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
        
        self.performSegue(withIdentifier: "jumpBackM2", sender: self)//jump back to MedicationMainVC after click button Confirm
        
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
