//
//  RecommendViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-14.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class RecommendViewController: UIViewController {
var weight = ""
var age = ""
    
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    
    @IBOutlet weak var Experweek: UILabel!
    @IBOutlet weak var test: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Label2.text = Variables.age
        Label3.text = Variables.weight
        test.layer.cornerRadius = 15
        test.layer.borderColor = UIColor.black.cgColor
        test.layer.borderWidth = 0.5
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
