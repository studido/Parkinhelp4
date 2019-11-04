//
//  MenuOption.swift
//  SideMenuTutorial
//
//  Created by MICHAEL on 2019-11-03.
//  Copyright © 2019 MICHAEL. All rights reserved.
//
//create the menu and put the labels inside 
import UIKit

enum MenuOption: Int,CustomStringConvertible {
    
    case myAccount
    case Message
    case Notification
    case aboutUs
    
    var description: String {
        switch self {
        case .myAccount: return "My Account"
        case .Message: return "Message"
        case .Notification: return "Notifications"
        case .aboutUs: return "About Us"
        }
    }
    
    var image: UIImage {
        switch self {
        case .myAccount: return UIImage(named: "person") ?? UIImage()
        case .Message: return UIImage(named: "mail") ?? UIImage()
        case .Notification: return UIImage(named: "menu") ?? UIImage()
        case .aboutUs: return UIImage(named: "settings") ?? UIImage()
        }
    }
    
}
