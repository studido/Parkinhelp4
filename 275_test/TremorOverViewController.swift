//
//  TremorOverViewController.swift
//  275_test
//
//  Created by Evan Lee on 2019-11-08.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import Foundation
import UIKit


class TremorOverViewController: UIViewController {
    fileprivate let tremorManager:TremorManager = TremorManager.shared()
    fileprivate var res : [(([Double],[Double]),Double,Double)]!
    fileprivate var score : Double!
    
    @IBOutlet weak var SaveButtion: UIButton!
    @IBOutlet weak var RetryButton: UIButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBAction func SaveButtonClicked(_ sender: Any) {
        tremorManager.save(score: res![1].1)
        self.performSegue(withIdentifier: "goToMainMenu", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        res = tremorManager.processAll()
        print("Accel\nFreq: \(res[0].1), Pow: \(res[0].2)\n")
        print("Gyro\nFreq: \(res[1].1), Pow: \(res[1].2)\n")
        
        let timestamp:Date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let strDate = dateFormatter.string(from: timestamp)
        print(strDate)
        score = res[1].1
        self.ScoreLabel.text = "\(score!)"
        print("setting score label to value ", score!)
    }
}
