//
//  UserSelectViewController.swift
//  275_test
//
//  Created by Sterling Smith on 10/31/19.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class UserSelectViewController: UIViewController {

    @IBOutlet weak var DoctorButton: UIButton!
    @IBOutlet weak var PatientButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DoctorButton.layer.cornerRadius = 15
        PatientButton.layer.cornerRadius = 15
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
