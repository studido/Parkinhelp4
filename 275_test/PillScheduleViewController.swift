//
//  PillScheduleViewController.swift
//  Main
//
//  Created by Dongyue Shi on 2019/11/9.
//  Copyright © 2019年 Liangchen Zou. All rights reserved.
//

import UIKit

class PillScheduleViewController: UIViewController {
    let transition = SlideInTransition()
    var topView: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = {menuType in
            self.transitionToNew(menuType)
            //print(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self as? UIViewControllerTransitioningDelegate
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


