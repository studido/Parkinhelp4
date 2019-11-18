//
//  ViewController.swift
//  Main
//
//  Created by Dongyue Shi on 2019/11/8.
//  Copyright © 2019年 Liangchen Zou. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let transition = SlideInTransition()
    var topView: UIView?
    
    @IBOutlet weak var GraphLabel: UILabel!
    
    @IBOutlet weak var whiteback: UIImageView!
    @IBOutlet weak var TremorGraph: UIButton!
    @IBOutlet weak var TremorMeasurement: UIButton!
    @IBOutlet weak var ExerciseList: UIButton!
    
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
