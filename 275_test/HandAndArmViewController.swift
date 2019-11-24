//
//  HandAndArmViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-24.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class HandAndArmViewController: UIViewController {
    @IBOutlet weak var arms: UIButton!
    
    @IBOutlet weak var hands: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arms.layer.cornerRadius = 15
        arms.layer.borderColor = UIColor.black.cgColor
        arms.layer.borderWidth = 0.5
        hands.layer.cornerRadius = 15
        hands.layer.borderColor = UIColor.black.cgColor
        hands.layer.borderWidth = 0.5

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
