//
//  ChestViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-17.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class ChestViewController: UIViewController {

    @IBOutlet weak var open: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        open.layer.cornerRadius = 15
        open.layer.borderColor = UIColor.black.cgColor
        open.layer.borderWidth = 0.5
        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func chestVi(_ sender: Any)
    {
        UIApplication.shared.open(URL(string:"https://www.youtube.com/watch?v=89e518dl4I8")! as URL,options:[:],completionHandler: nil) 
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
