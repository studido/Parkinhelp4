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
    

    @IBOutlet weak var extitle: UILabel!
    @IBOutlet weak var totalex: UILabel!
    @IBOutlet weak var totalrep: UILabel!
    @IBOutlet weak var exercise1: UILabel!
    @IBOutlet weak var exercise2: UILabel!
    @IBOutlet weak var exercise3: UILabel!
    @IBOutlet weak var sets1: UILabel!
    @IBOutlet weak var reps1: UILabel!
    @IBOutlet weak var sets2: UILabel!
    @IBOutlet weak var reps2: UILabel!
    @IBOutlet weak var sets3: UILabel!
    @IBOutlet weak var reps3: UILabel!
    @IBOutlet weak var Repititionlabel: UILabel!
    
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
                    //intensity
                    let totalrep2 : Int? = Int(totalrep1!)
                    var sets1int = totalrep2!-3
                    if sets1int < 2 {
                        sets1int = 2
                    }
                    let reps1int = totalrep2
                    var sets2int = totalrep2!-4
                    if sets2int < 2 {
                        sets2int = 2
                    }
                    let reps2int = totalrep2!+5
                    var sets3int = totalrep2!-5
                    if sets3int < 2 {
                        sets3int = 2
                    }
                    let reps3int = totalrep2!+3
                    let experweekint = totalex1!*3
                    let repsperweekint = reps1int!*sets1int + reps2int*sets2int + reps3int*sets3int
                    
                    let finalsets1 = String(sets1int)
                    let finalreps1 = String(reps1int!)
                    let finalsets2 = String(sets2int)
                    let finalreps2 = String(reps2int)
                    let finalsets3 = String(sets3int)
                    let finalreps3 = String(reps3int)
                    let finalexstring = String(experweekint)
                    let finalrepstring = String(repsperweekint)

                    totalex.text = finalexstring
                    totalrep.text = finalrepstring
                    sets1.text = finalsets1
                    reps1.text = finalreps1
                    sets2.text = finalsets2
                    reps2.text = finalreps2
                    sets3.text = finalsets3
                    reps3.text = finalreps3
                    // to test repititionlabel
                   // totalex1 = 2
                    if totalex1 != 3 {
                        if totalex1 == 4 {
                            Repititionlabel.text = "Complete Monday, Tuesday, Wednesday, and Thursday"
                        }
                        if totalex1 == 5{
                            Repititionlabel.text = "Monday, Tuesday, Wednesday, Thursday, and Friday"
                        }
                        if totalex1 == 2{
                            Repititionlabel.text = "Complete every Monday and Wednesday"
                        }
                    }
                    let armsfocus = UserDefaults.standard.object(forKey: "armsfocus") as? Int
                    let neckfocus = UserDefaults.standard.object(forKey: "neckfocus") as? Int
                    let backfocus = UserDefaults.standard.object(forKey: "backfocus") as? Int
                    let handsfocus = UserDefaults.standard.object(forKey: "handsfocus") as? Int
                    var backused = 0
                    var armsused = 0
                    var handsused = 0
                    var neckused = 0
                    var focuschoice = ""
                    var focuscheck = 0
                    var focuscheck2 = 0
                    
                    //exercise slot 1
                    if armsfocus == 1 {
                        exercise1.text = "Forearm lifts"
                        armsused = 1
                        focuschoice = "Wrist Twists"
                    }
                    else if backfocus == 1 {
                        exercise1.text = "Back Stretches"
                        backused = 1
                        focuschoice = "Waist Stretches"
                    }
                    else if handsfocus == 1 {
                        exercise1.text = "Hand Stretches"
                        handsused = 1
                        focuschoice = "Finger Massages"
                    }
                    else if neckfocus == 1 {
                        exercise1.text = "Neck Twists"
                        neckused = 1
                        focuschoice = "Neck-Band Pulls"
                    }
                    else {
                        exercise1.text = "Dumb-bell Chest Press"
                        focuschoice = "No Focus"
                        focuscheck   = 1
                    }
                    
                    //exercise slot 2
                    if focuscheck == 0 {
                    if neckfocus == 1 && neckused == 0 {
                        exercise2.text = "Neck Twists"
                        focuschoice = "Second Neck thing"
                        neckused = 1
                    }
                    else if handsfocus == 1 && handsused == 0 {
                        exercise2.text = "Hand Stretches"
                        focuschoice = "Other Hand Thing"
                        handsused = 1
                    }
                    else if backfocus == 1 && backused == 0 {
                        exercise2.text = "Back Stretches"
                        focuschoice = "Other back thing"
                        backused = 1
                    }
                    else {
                        exercise2.text = focuschoice
                        if focuschoice == "Wrist Twists" {
                            armsused += 1
                        }
                        if focuschoice == "Waist Stretches" {
                            backused += 1
                        }
                        if focuschoice == "Finger Massages" {
                            handsused += 1
                        }
                        if focuschoice == "Neck-Band Pulls" {
                            neckused += 1
                        }
                
                        focuscheck2  = 1
                        }
                    //exercise slot 3
                    if focuscheck2 == 1 {
                            exercise3.text = "Neck Twists"
                        }
                    else if handsfocus == 1 && handsused < 2 {
                            exercise3.text = "Finger Massages"
                        }
                    else if backfocus == 1 && backused < 2  {
                        exercise3.text = "Waist Stretches"
                        }
                    else if armsfocus == 1 && armsused < 2 {
                        exercise3.text = "Wrist Twists"
                        }
                    else {
                        exercise3.text = "shouldnt get here"
                        }
                        
                    }
                    else {
                    exercise2.text = "Forearm lifts"
                    exercise3.text = "Neck Twists"
                    }
                    
                    
                    
                    
                    
                    
                }
               
        extitle.layer.cornerRadius = 25
        exercise1.layer.cornerRadius = 15
        exercise2.layer.cornerRadius = 15
        exercise3.layer.cornerRadius = 15
       
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
