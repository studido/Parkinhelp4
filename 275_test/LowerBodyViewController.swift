//
//  LowerBodyViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-24.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class LowerBodyViewController: UIViewController {
    @IBOutlet weak var calf: UIButton!
    @IBOutlet weak var foot: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calf.layer.cornerRadius = 15
        calf.layer.borderColor = UIColor.black.cgColor
        calf.layer.borderWidth = 0.5
        foot.layer.cornerRadius = 15
        foot.layer.borderColor = UIColor.black.cgColor
        foot.layer.borderWidth = 0.5
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
