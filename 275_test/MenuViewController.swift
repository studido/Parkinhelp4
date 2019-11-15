//
//  MenuViewController.swift
//  Main
//
//  Created by Dongyue Shi on 2019/11/8.
//  Copyright © 2019年 Liangchen Zou. All rights reserved.
//

import UIKit
import GoogleSignIn
enum MenuType: Int {
    
    case Home
    case MyAccount
    case Message
    case AboutUs
}
class MenuViewController: UITableViewController {
    
    @IBAction func signOutUserLoggedInWithGoogle(_sender: UIButton) {
        GIDSignIn.sharedInstance()?.signOut()
        UserDefaults.standard.set(false, forKey: "usersignedIn")
        UserDefaults.standard.synchronize()
        print("Signed out via google")
        self.performSegue(withIdentifier: "goToLogin", sender: self)
        
    }
    
    var didTapMenuType : ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true){[weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }

}
