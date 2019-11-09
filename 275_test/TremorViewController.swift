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
    let collector:DataRun = DataRun.shared()
    
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("Start Did Appear")
        
    }
    
    var timer = Timer()
    var seconds = 15
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

