//
//  ViewController.swift
//  Exercise_Zou
//
//  Created by MICHAEL on 2019-11-08.
//  Copyright © 2019 MICHAEL. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController {
    
    @IBOutlet weak var UpperBody: UIButton!
    
    @IBOutlet weak var Arms: UIButton!
    
    @IBOutlet weak var LowerBody: UIButton!
    
    @IBOutlet weak var Head: UIButton!
    
    @IBOutlet weak var Face: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func headface(_ sender: UIButton) {
        
        //go to video for face
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)
        
    }
    
    @IBAction func headneck(_ sender: UIButton) {
        //go to video for neck
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    /*
    @IBAction func HEAD(_ sender: UIButton) {
        //skip to head page
        print("button pressed")
        self.performSegue(withIdentifier: "head", sender: self)
    }
    
    /*
    @IBAction func upperbody(_ sender: UIButton) {
        //skip to upperbody page
        print("button pressed")
        self.performSegue(withIdentifier: upper, sender: self)    }
    @IBAction func arm(_ sender: UIButton) {
        //skip to arm page
        print("button pressed")
        self.performSegue(withIdentifier: ARN, sender: self)    }
    @IBAction func lowerbody(_ sender: UIButton) {
        //skip to lowerbody page
        print("button pressed")
        self.performSegue(withIdentifier: LOWER, sender: self)    }
    */
    
    
//    @IBAction func backtomain(_ sender: UIButton) {
//        //back to last page
//        print("back button pressed")
//        self.performSegue(withIdentifier: stonemenu , sender: self)
//    }
    @IBAction func headface(_ sender: UIButton) {
        
        //go to video for face
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)
        
    }
    @IBAction func headneck(_ sender: UIButton) {
        //go to video for neck
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
//    @IBAction func headbacktomain(_ sender: UIButton) {
//        print("back button pressed")
//        self.performSegue(withIdentifier: EXERCISEMAIN, sender: self)
//    }
//
    @IBAction func upperchest(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
    @IBAction func upperback(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
    @IBAction func uppershoulder(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
//    @IBAction func upperbacktomain(_ sender: UIButton) {
//        print("back button pressed")
//        self.performSegue(withIdentifier: EXERCISEMAIN, sender: self)            }
    
    @IBAction func armupperarms(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
    @IBAction func armlowarm(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
    @IBAction func armhands(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
//    @IBAction func armbacktomain(_ sender: UIButton) {
//        print("back button pressed")
//        self.performSegue(withIdentifier: EXERCISEMAIN, sender: self)    }
    
    @IBAction func lowerthigh(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
    @IBAction func lowercalf(_ sender: UIButton) {
        
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
    @IBAction func lowerfoot(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:"http://www.youtube.com")! as URL,options:[:],completionHandler: nil)    }
    
//    @IBAction func lowerbacktomain(_ sender: UIButton) {
//        print("back button pressed")
//        self.performSegue(withIdentifier: EXERCISEMAIN, sender: self)
//    }
 */
}

