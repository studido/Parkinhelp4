//
//  MondayViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-29.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit


var listfortime = ["10:00","11:00","12:00","13:00"]
var list = ["Take some med","Do some sport","Eat some fruit","Kick stone's ass"]


class MondayViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var monday: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var Events: UILabel!
    @IBOutlet weak var mondayble: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = listfortime[indexPath.row] + "               " + list[indexPath.row]
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            list.remove(at: indexPath.row)
            mondayble.reloadData()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        mondayble.reloadData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationController?.isNavigationBarHidden = true


    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
