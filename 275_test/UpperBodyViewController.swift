//
//  UpperBodyViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-24.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class UpperBodyViewController: UIViewController {

    @IBOutlet weak var Chest: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var Shoulder: UIButton!
    
    
    override func viewDidLoad() {
        
        Chest.layer.cornerRadius = 15
        Chest.layer.borderColor = UIColor.black.cgColor
        Chest.layer.borderWidth = 0.5
        Back.layer.cornerRadius = 15
        Back.layer.borderColor = UIColor.black.cgColor
        Back.layer.borderWidth = 0.5
        Shoulder.layer.cornerRadius = 15
        Shoulder.layer.borderColor = UIColor.black.cgColor
        Shoulder.layer.borderWidth = 0.5
        
        
        
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
