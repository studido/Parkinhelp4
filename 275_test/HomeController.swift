//
//  HomeController.swift
//  SideMenuTutorial
//
//  Created by MICHAEL on 2019-11-03.
//  Copyright © 2019 MICHAEL. All rights reserved.
//

import UIKit

class HomeController: UIViewController{
    // Mark: - Properties
    
    
    var delegate: HomeControllerDelegate?
    
    // Mark: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        label.center = CGPoint(x: 160, y: 300)
        label.textAlignment = .center
        label.text = "Tremor Measurements"
        self.view.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        label2.center = CGPoint(x: 160, y: 600)
        label2.textAlignment = .center
        label2.text = "Exercise To Do"
        self.view.addSubview(label2)
        
        
        
        
        let button_Main_Page = UIButton.init(type: .system)
        let button_Physical_Condition_Test = UIButton.init(type: .system)
        let button_Exercise = UIButton.init(type: .system)
        let button_Pill = UIButton.init(type: .system)
        let button_Contaction = UIButton.init(type: .system)
        
        
        button_Main_Page.frame = CGRect(x: 0.0,y: 800.0, width:80.0,height:80.0)
        button_Physical_Condition_Test.frame = CGRect(x: 80.0,y: 800.0, width:80,height:80.0)
        button_Exercise.frame = CGRect(x: 160.0,y: 800.0, width:80.0,height:80.0)
        button_Pill.frame = CGRect(x: 240.0,y: 800.0, width:80.0,height:80.0)
        button_Contaction.frame = CGRect(x: 320.0,y: 800.0, width:80.0,height:80.0)
        
        
        button_Main_Page.setTitle("Home Page", for: .normal)
        button_Main_Page.layer.borderWidth = 5.0
        button_Main_Page.layer.borderColor = UIColor.white.cgColor
        button_Main_Page.backgroundColor = UIColor.lightGray
        button_Main_Page.titleLabel?.textColor = UIColor.white
        //button_Main_Page.titleLabel?.font = UIFont(name: "Home Page",size: 20 )
        
        
        button_Physical_Condition_Test.setTitle("Physical \nCondition \nTest", for: .normal)
        button_Physical_Condition_Test.layer.borderWidth = 5.0
        button_Physical_Condition_Test.layer.borderColor = UIColor.white.cgColor
        button_Physical_Condition_Test.backgroundColor = UIColor.lightGray
        button_Physical_Condition_Test.titleLabel?.textColor = UIColor.white
        
        
        
        button_Exercise.setTitle("Exercise Recommended", for: .normal)
        button_Exercise.layer.borderWidth = 5.0
        button_Exercise.layer.borderColor = UIColor.white.cgColor
        button_Exercise.backgroundColor = UIColor.lightGray
        button_Exercise.titleLabel?.textColor = UIColor.white

        
        
        
        button_Pill.setTitle("Pill Schedule", for: .normal)
        button_Pill.layer.borderWidth = 5.0
        button_Pill.layer.borderColor = UIColor.white.cgColor
        //button_Pill.layer.cornerRadius = 10
        button_Pill.backgroundColor = UIColor.lightGray
        button_Pill.titleLabel?.textColor = UIColor.white
        
        
        
        button_Contaction.setTitle("Contact The Rapist", for: .normal)
        button_Contaction.layer.borderWidth = 5.0
        button_Contaction.layer.borderColor = UIColor.white.cgColor
        button_Contaction.backgroundColor = UIColor.lightGray
        button_Contaction.titleLabel?.textColor = UIColor.white
        
        
        button_Main_Page.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        button_Physical_Condition_Test.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        button_Exercise.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        button_Pill.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        button_Contaction.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        
        
        
        
        //print(self.view!.bounds.width)
        //print(self.view!.bounds.height)
        
        
        
        
        self.view.addSubview(button_Main_Page)
        self.view.addSubview(button_Physical_Condition_Test)
        self.view.addSubview(button_Exercise)
        self.view.addSubview(button_Pill)
        self.view.addSubview(button_Contaction)
        
        //print("Home Page Button testingggggggg")
        configureNavigationBar()
    }
    
    @objc func buttonClicked(_ : UIButton) {
        print("Button testing")
    }
    
    
    // Mark: - Handlers
    @objc func handleMenuToggle(){
        delegate?.handleMenuToggle()
    }
    
    
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Statistic"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_menu_white_3x").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
}

