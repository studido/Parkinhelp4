//
//  backViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-17.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class backViewController: UIViewController {

    @IBOutlet weak var backimage: UIImageView!
    @IBOutlet weak var backtext: UITextView!
    @IBOutlet weak var watch: UIButton!
    
    override func viewDidLoad() {
        watch.layer.cornerRadius = 15
        watch.layer.borderColor = UIColor.black.cgColor
        watch.layer.borderWidth = 0.5
        super.viewDidLoad()
             // Do any additional setup after loading the view.
    }
    
    @IBAction func backvideo(_ sender: UIButton) {
        
        UIApplication.shared.open(URL(string:"https://www.youtube.com/watch?v=2dS90O_cVGM"
            )! as URL,options:[:],completionHandler: nil)
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
