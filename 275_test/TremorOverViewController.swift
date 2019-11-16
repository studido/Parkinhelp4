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
    fileprivate let collector:TremorManager = TremorManager.shared()
    //fileprivate var res : [(([Double],[Double]),Double,Double)]?
    fileprivate var score : Double!
    
    @IBOutlet weak var SaveButtion: UIButton!
    @IBOutlet weak var RetryButton: UIButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBAction func SaveButtonClicked(_ sender: Any) {
        //save the data to db
    }

    override func viewWillAppear(_ animated: Bool) {
        let res = collector.processAll()
        collector.end()
        // print processed data
        //ScoreLabel.text = "40"
        print("Accel\nFreq: \(res[0].1), Pow: \(res[0].2)\n")
        print("Gyro\nFreq: \(res[1].1), Pow: \(res[1].2)\n")
        score = res[1].1
        ScoreLabel.text = "\(String(describing: score))"
        
        let timestamp:Date = collector.getDate() ?? Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let strDate = dateFormatter.string(from: timestamp)
        print(strDate)
    }
}
