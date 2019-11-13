//
//  MenuViewController.swift
//  Main
//
//  Created by Dongyue Shi on 2019/11/8.
//  Copyright © 2019年 Liangchen Zou. All rights reserved.
//

import UIKit
enum MenuType: Int {
    
    case Home
    case MyAccount
    case Message
    case AboutUs
}
class MenuViewController: UITableViewController {
    
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
