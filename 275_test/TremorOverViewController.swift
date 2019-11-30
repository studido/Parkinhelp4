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
        self.showSpinner(onView: self.view)
        UserDefaults.standard.set(res![1].1, forKey: "tremorScore")
        UserDefaults.standard.synchronize()
        tremorManager.save()
        self.removeSpinner()
        
        //present saved alert to notify user that data has been successfully saved
        let successAlert = UIAlertController(title: "Data saved", message: "", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in
            self.performSegue(withIdentifier: "goToMainMenu", sender: self)})
        successAlert.addAction(okButton)
        self.present(successAlert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        res = tremorManager.processAll()
        print("Accel\nFreq: \(res[0].1), Pow: \(res[0].2)\n")
        print("Gyro\nFreq: \(res[1].1), Pow: \(res[1].2)\n")
        
        score = res![1].1
        self.ScoreLabel.text = String(format: "%.1f", score)
        self.ScoreLabel.textColor = UIColor.black
        self.ScoreLabel.font = self.ScoreLabel.font.withSize(50)
    }
}
