//
//  ContainerController.swift
//  SideMenuTutorial
//
//  Created by MICHAEL on 2019-11-03.
//  Copyright © 2019 MICHAEL. All rights reserved.
//

import UIKit

class ContainerController: UIViewController{
    // Mark: - Properties
    
    
    var menuController: UIViewController!
    var centerController: UIViewController!
    var isExpanded = false
    
    // Mark: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    // Mark: - Handlers
    func configureHomeController(){
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    func configureMenuController(){
        if menuController == nil{
            // adding the menu controller
            menuController = MenuController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controller..")
        }
    }
    func showMenuController(shouldExpand: Bool)
    {
        if shouldExpand
        {
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion:nil)
        }
        else{
            //hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
                
            }, completion:nil)
        }
    }
}



extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(){
        
        if !isExpanded{
            configureMenuController()
        }
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
}
