//
//  MedicationMainViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-30.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class MedicationMainViewController: UIViewController {
    @IBOutlet weak var monday: UIButton!
    @IBOutlet weak var friday: UIButton!
    @IBOutlet weak var thursday: UIButton!
    @IBOutlet weak var wednesday: UIButton!
    @IBOutlet weak var tuesday: UIButton!
    @IBOutlet weak var sunday: UIButton!
    
    @IBOutlet weak var saturday: UIButton!
    
    override func viewDidLoad() {
        monday.layer.cornerRadius = 15
        monday.layer.borderWidth = 1
        tuesday.layer.cornerRadius = 15
        tuesday.layer.borderWidth = 1
        wednesday.layer.cornerRadius = 15
        wednesday.layer.borderWidth = 1
        thursday.layer.cornerRadius = 15
        thursday.layer.borderWidth = 1
        friday.layer.cornerRadius = 15
        friday.layer.borderWidth = 1
        saturday.layer.cornerRadius = 15
        saturday.layer.borderWidth = 1
        sunday.layer.cornerRadius = 15
        sunday.layer.borderWidth = 1
        super.viewDidLoad()

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
