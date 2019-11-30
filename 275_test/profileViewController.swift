//
//  profileViewController.swift
//  275_test
//
//  Created by Dongyue Shi on 2019/11/29.
//  Copyright © 2019年 Sterling Smith. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class profileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTremorScores(completion: {data in
            let xPosition=200
            var yPosition=100
            var item=[String]()
            item.append("age")
            item.append("contactNumber")
            item.append("dateOfBirth")
            item.append("durationOfDisease")
            item.append("email")
            item.append("firstName")
            item.append("lastName")
            item.append("gender")
            item.append("height")
            item.append("intensity")
            item.append("lastDateFilledSurvey")
            item.append("repetitions")
            item.append("userType")
            item.append("weight")
            
            if(data[0]=="nothing")
            {}
            else
            {
                for index in 0...(item.count-1)
                {
                    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 25))
                    label.center = CGPoint(x: xPosition, y: yPosition)
                    yPosition+=35
                    label.textAlignment = .center
                    let itemText=item[index]
                    let dataText=data[index]
                    label.text = itemText+":  "+dataText
                    self.view.addSubview(label)
                }
                
            }
            
            
        })
        // Do any additional setup after loading the view.
    }
    
    
    func getTremorScores(completion: @escaping(_ data:[String]) -> Void) {
        let ref : DatabaseReference! = Database.database().reference()
        //var isDataExist=false
        //print(ref.child("Users").child(Firebase.Auth.auth().currentUser!.uid).child("TremorScores"))
        ref.child("Users").child(Firebase.Auth.auth().currentUser!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if (snapshot.exists()) {
                var data = [String]()
                let value = snapshot.value as? NSDictionary
                data.append(value?["age"] as? String ?? "toBeEntered")
                data.append(value?["contactNumber"] as? String ?? "toBeEntered")
                data.append(value?["dateOfBirth"] as? String ?? "toBeEntered")
                data.append(value?["durationOfDisease"] as? String ?? "toBeEntered")
                data.append(value?["email"] as? String ?? "toBeEntered")
                data.append(value?["firstName"] as? String ?? "toBeEntered")
                data.append(value?["lastName"] as? String ?? "toBeEntered")
                data.append(value?["gender"] as? String ?? "toBeEntered")
                data.append(value?["height"] as? String ?? "toBeEntered")
                data.append(value?["intensity"] as? String ?? "toBeEntered")
                data.append(value?["lastDateFilledSurvey"] as? String ?? "toBeEntered")
                data.append(value?["repetitions"] as? String ?? "toBeEntered")
                data.append(value?["userType"] as? String ?? "toBeEntered")
                data.append(value?["weight"] as? String ?? "toBeEntered")
                print(data)
                completion(data)
            }
            else{completion(["nothing"])}
        })
        
    }
    
}
