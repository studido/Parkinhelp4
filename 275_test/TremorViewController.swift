//
//  TremorViewController.swift
//  275_test
//
//  Created by Evan Lee on 2019-11-07.
//  Copyright © 2019 Team Dancing Dragons. All rights reserved.
//

import Foundation
import UIKit
import CoreMotion

class TremorViewController: UIViewController {
    //Variables
    let collector:TremorManager = TremorManager.shared()
    
    @IBOutlet weak var Whiteback: UIImageView!
    
    @IBOutlet weak var TremorPic: UIImageView!
    //Outlets
    @IBOutlet weak var readyButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    @IBAction func readyButton(_ sender: Any) {
        startTimer()
        readyButton.isHidden = true
        collector.start()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tremor view loaded")
        Whiteback.layer.cornerRadius = 15
        Whiteback.layer.borderColor = UIColor.black.cgColor
        Whiteback.layer.borderWidth = 3
        readyButton.layer.cornerRadius = 15
        readyButton.layer.borderColor = UIColor.black.cgColor
        readyButton.layer.borderWidth = 0.5
        TremorPic.layer.cornerRadius = 15
        TremorPic.layer.borderColor = UIColor.black.cgColor
        TremorPic.layer.borderWidth = 1.5
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("Start Did Appear")
        
    }
    
    var timer = Timer()
    var seconds = 5
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.updateTime)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if seconds == 0 {
            timer.invalidate()
            performSegue(withIdentifier: "TremorOverSegue", sender: self)
            //removeAudioPlayer()
            //gameOver()
        }else {
            seconds -= 1
            //shootObj()
            //playCannon()
            timeLabel.text = "\(seconds)"
        }
    }
}

