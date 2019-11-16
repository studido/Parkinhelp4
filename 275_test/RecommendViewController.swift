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
    
    @IBOutlet weak var extitle: UIButton!
    
    @IBOutlet weak var totalex: UILabel!
    
    @IBOutlet weak var totalrep: UILabel!
    
    
            override func viewDidLoad() {
        super.viewDidLoad()
                /*
                let totalex1 : Int? = Int(Variables.age)
                let totalrep1 : Int? = Int(Variables.weight)
                let totalex2 = String(totalex1!)
                let totalrep2 = String(totalrep1!)
                totalex.text = totalex2
                totalrep.text = totalrep2
                */
                
                if let repitition = UserDefaults.standard.object(forKey: "Repitition") as? String
                {
                    let totalrep1 = UserDefaults.standard.object(forKey: "Intensity") as? String
                    let totalex1 : Int? = Int(repitition)
                    let totalrep2 : Int? = Int(totalrep1!)
                    let finalexperweek = totalex1!*3
                    let finalrepperweek = totalex1!*totalrep2!*3*3
                    let finalexstring = String(finalexperweek)
                    let finalrepstring = String(finalrepperweek)
                    totalex.text = finalexstring
                    totalrep.text = finalrepstring
                }
                
                
                
                
                
                
                
                
        extitle.layer.cornerRadius = 25
       
        // Do any additional setup after loading the view.
    }
    /*
    //safer to put in here to avoid crash, but SLOWER
     
     
     
     
     
     
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "Age") as? String
        {
            totalrep.text = x
        }
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
