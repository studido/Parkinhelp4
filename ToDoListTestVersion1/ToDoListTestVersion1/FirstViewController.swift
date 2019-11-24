//
//  FirstViewController.swift
//  ToDoListTestVersion1
//
//  Created by MICHAEL on 2019-11-24.
//  Copyright © 2019 MICHAEL. All rights reserved.
//

import UIKit

var list = ["Take some med","Do some sport","Eat some fruit","Kick stone's ass"]


class FirstViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    

    @IBOutlet weak var mybleView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            list.remove(at: indexPath.row)
            mybleView.reloadData()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        mybleView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
