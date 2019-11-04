//
//  MenuOption.swift
//  SideMenuTutorial
//
//  Created by MICHAEL on 2019-11-03.
//  Copyright © 2019 MICHAEL. All rights reserved.
//

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
        case .myAccount: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
        case .Message: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Notification: return UIImage(named: "ic_menu_white_3x") ?? UIImage()
        case .aboutUs: return UIImage(named: "baseline_settings_white_24dp") ?? UIImage()
        }
    }
    
}
