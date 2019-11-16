//
//  FocusAreaViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-15.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class FocusAreaViewController: UIViewController {
    @IBOutlet weak var check: UILabel!
    @IBOutlet weak var check2: UILabel!
    @IBOutlet weak var check3: UILabel!
    @IBOutlet weak var check4: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Hands(_ sender: Any) {
        
        if check2.layer.backgroundColor != UIColor.yellow.cgColor{
                check2.layer.backgroundColor = UIColor.yellow.cgColor
        }
        else {
            check2.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    @IBAction func Arms(_ sender: Any) {
        if check3.layer.backgroundColor != UIColor.yellow.cgColor{
            check3.layer.backgroundColor = UIColor.yellow.cgColor
        }
        else {
            check3.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    @IBAction func Neck(_ sender: Any) {
        if check4.layer.backgroundColor != UIColor.yellow.cgColor{
            check4.layer.backgroundColor = UIColor.yellow.cgColor
        }
        else {
            check4.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        if check.layer.backgroundColor != UIColor.yellow.cgColor{
            check.layer.backgroundColor = UIColor.yellow.cgColor
        }
        else {
            check.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    @IBAction func Done(_ sender: Any) {
        if check.layer.backgroundColor == UIColor.yellow.cgColor {
             UserDefaults.standard.set(1, forKey: "backfocus")
        }
        else
        {
             UserDefaults.standard.set(0, forKey: "backfocus")
        }
        if check2.layer.backgroundColor == UIColor.yellow.cgColor {
            UserDefaults.standard.set(1, forKey: "handsfocus")
        }
        else
        {
            UserDefaults.standard.set(0, forKey: "handsfocus")
        }
        if check3.layer.backgroundColor == UIColor.yellow.cgColor {
            UserDefaults.standard.set(1, forKey: "armsfocus")
        }
        else
        {
            UserDefaults.standard.set(0, forKey: "armsfocus")
        }
        if check4.layer.backgroundColor == UIColor.yellow.cgColor {
            UserDefaults.standard.set(1, forKey: "neckfocus")
        }
        else
        {
            UserDefaults.standard.set(0, forKey: "neckfocus")
        }
        performSegue(withIdentifier: "focussegue", sender: self)
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
