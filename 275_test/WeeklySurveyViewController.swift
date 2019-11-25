//
//  WeeklySurveyViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-23.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class WeeklySurveyViewController: UIViewController {
    
    @IBOutlet weak var RepYesBack: UILabel!
    
    
    @IBOutlet weak var difficultyLabel: UITextField!
    
    @IBOutlet weak var IntYesBack: UILabel!
    
    
    
    
    override func viewDidLoad() {

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
    var repincrease : Int = 0
    var intensityincrease : Int = 0
    @IBAction func YesRepititions(_ sender: Any) {
 
        if RepYesBack.layer.backgroundColor != UIColor.yellow.cgColor{
            RepYesBack.layer.backgroundColor = UIColor.yellow.cgColor
            repincrease = 1
        }
        else {
            RepYesBack.layer.backgroundColor = UIColor.clear.cgColor
            repincrease = 0
        }
    }
    
    @IBAction func YesIntensity(_ sender: Any) {
        if IntYesBack.layer.backgroundColor != UIColor.yellow.cgColor{
            IntYesBack.layer.backgroundColor = UIColor.yellow.cgColor
            intensityincrease = 1
        }
        else {
            IntYesBack.layer.backgroundColor = UIColor.clear.cgColor
            intensityincrease = 0
        }
        
    }
    
    
    @IBAction func SaveButton(_ sender: Any) {
        if difficultyLabel.text != ""{
        if repincrease == 1{
            var repitition = UserDefaults.standard.object(forKey: "Repitition") as? String
            var intrep : Int?  = Int(repitition!)
            intrep! += 1
            repitition = String(intrep!)
            UserDefaults.standard.set(repitition, forKey: "Repitition")}
        if intensityincrease == 1{
            var intensity = UserDefaults.standard.object(forKey: "Intensity") as? String
            var intensityint : Int?  = Int(intensity!)
            let difficulty : Int? = Int(difficultyLabel.text!)
            if difficulty! < 3{
                intensityint! += 3
            }
            if difficulty! < 7{
                intensityint! += 2
            }
            else {
                intensityint! += 1
            }
            intensity = String(intensityint!)
            UserDefaults.standard.set(intensity, forKey: "Intensity")
        }
        let strDate = getStrDate()
        let ref : DatabaseReference! = Database.database().reference()
        let uid = Firebase.Auth.auth().currentUser!.uid
            ref.child("/Users/\(uid)/lastDateFilledSurvey").setValue(strDate)
        performSegue(withIdentifier: "repeatsurveysegue", sender: self)
            
            
        }
        else
        {
        }
        
    }
    

    

}
/*
 if repincrease == 1{
 var repitition = UserDefaults.standard.object(forKey: "Repitition") as? String
 var intrep : Int?  = Int(repitition!)
 intrep! += 1
 repitition = String(intrep!)
 UserDefaults.standard.set(repitition, forKey: "Repitition")}
 
 
 if intensityincrease == 1{
 var intensity = UserDefaults.standard.object(forKey: "Intensity") as? String
 var intensityint : Int?  = Int(intensity!)
 let difficulty : Int? = Int(difficultyLabel.text!)
 if difficulty! < 3{
 intensityint! += 3
 }
 if difficulty! < 7{
 intensityint! += 2
 }
 else {
 intensityint! += 1
 }
 intensity = String(intensityint!)
 UserDefaults.standard.set(intensity, forKey: "Intensity")
 }
 */
