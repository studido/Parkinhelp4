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
    @IBOutlet weak var XAccel: UILabel!
    @IBOutlet weak var yAccel: UILabel!
    @IBOutlet weak var zAccel: UILabel!
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Tremor view loaded")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("Start Did Appear")
        myAccelerometer()
        
    }
    
    func myAccelerometer() {
        print("Start Accelerometer")
        motion.accelerometerUpdateInterval = 1.0/60.0
        motion.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            print(data as Any)
            if let data = self.motion.accelerometerData {
                self.view.reloadInputViews()
                self.XAccel!.text = "x: \(data.acceleration.x)"
                self.yAccel!.text = "y: \(data.acceleration.y)"
                self.zAccel!.text = "z: \(data.acceleration.z)"
                
                // Use the accelerometer data in your app.
            }
        }
        
        return
    }
    
}

