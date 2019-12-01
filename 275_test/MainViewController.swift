//
//  ViewController.swift
//  Main
//
//  Created by Dongyue Shi on 2019/11/8.
//  Copyright © 2019年 Liangchen Zou. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MainViewController: UIViewController {
    
    let transition = SlideInTransition()
    var topView: UIView?
    
    @IBOutlet weak var GraphLabel: UILabel!
    
    @IBOutlet weak var whiteback: UIImageView!
    @IBOutlet weak var TremorGraph: UIButton!
    @IBOutlet weak var TremorMeasurement: UIButton!
    @IBOutlet weak var ExerciseList: UIButton!
    
    @IBOutlet weak var MedicationSchedule: UIButton!
    
    @IBAction func facetimeButton(_ sender: UIButton) {
        getPhoneNumber(completion: {number in
            print("facetime button clicked")
            //facetime(phoneNumber: number) // have to somehow connect doctor's number here.
            if let facetimeURL:NSURL = NSURL(string: "facetime:+" + number) {
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(facetimeURL as URL)) {
                    //application.openURL(facetimeURL as URL);
                    application.open(facetimeURL as URL, options: [:], completionHandler: nil)
                    
                    // this works for opening a website in safari
                    // UIApplication.shared.open(URL(string:"https://www.youtube.com/watch?v=89e518dl4I8")! as URL,options:[:],completionHandler: nil)
                }
            }
            print ("end of facetime button")
        })
    }
    
    private func facetime(phoneNumber:String) {
        if let facetimeURL:NSURL = NSURL(string: "facetime:+12062350208") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(facetimeURL as URL)) {
                //application.openURL(facetimeURL as URL);
                application.open(facetimeURL as URL, options: [:], completionHandler: nil)
               
                // this works for opening a website in safari
                // UIApplication.shared.open(URL(string:"https://www.youtube.com/watch?v=89e518dl4I8")! as URL,options:[:],completionHandler: nil)
            }
        }

    }
    
    func getPhoneNumber(completion: @escaping(_ data:String) -> Void) {
        let ref : DatabaseReference! = Database.database().reference()
        var phoneNumber : String!
        ref.child("PhoneNumbers").observeSingleEvent(of: .value, with: { (snapshot) in
            
            if (snapshot.exists()) {
                let value = snapshot.value as! [String: String]
                phoneNumber = value[Variables.medicationId] ?? "-1"
                completion(phoneNumber)
            }
            else{completion("-1")}
        })
    }
    
  //  private func facetime(phoneNumber:String) {
      
        
        
    //    UIApplication.shared.openURL(NSURL(string: "facetime:2062350208") as! URL)

    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExerciseList.layer.cornerRadius = 15
        ExerciseList.layer.borderColor = UIColor.black.cgColor
        ExerciseList.layer.borderWidth = 0.5
        TremorMeasurement.layer.cornerRadius = 15
        TremorMeasurement.layer.borderColor = UIColor.black.cgColor
        TremorMeasurement.layer.borderWidth = 0.5
        GraphLabel.layer.cornerRadius = 15
        GraphLabel.layer.borderColor = UIColor.black.cgColor
        GraphLabel.layer.borderWidth = 0.5
        TremorGraph.layer.cornerRadius = 15
        TremorGraph.layer.borderColor = UIColor.black.cgColor
        TremorGraph.layer.borderWidth = 0.5
        whiteback.layer.cornerRadius = 25
        whiteback.layer.borderColor = UIColor.black.cgColor
        whiteback.layer.borderWidth = 3
        MedicationSchedule.layer.cornerRadius = 15
        MedicationSchedule.layer.borderColor = UIColor.black.cgColor
        MedicationSchedule.layer.borderWidth = 0.5
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = {menuType in
            self.transitionToNew(menuType)
            //print(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController,animated:true)
    }
    
    func transitionToNew(_ menuType:MenuType){
        let title = String(describing: menuType).capitalized
        self.title = title
        
        topView?.removeFromSuperview()
        switch menuType {
        case .MyAccount:
            let view = UIView()
            //view.backgroundColor = .lightGray
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .Message:
            let view = UIView()
            //view.backgroundColor = .lightGray
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .AboutUs:
            let view = UIView()
            //view.backgroundColor = .lightGray
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        default:
            break
        }
    }
}

extension MainViewController: UIViewControllerTransitioningDelegate{
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}


