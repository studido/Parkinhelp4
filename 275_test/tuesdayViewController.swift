//
//  tuesdayViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-29.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit
var listfortime2 = ["12:00","13:00","14:00","15:00"]
var list2 = ["Take some med1","Do some sport2","Eat some fruit3","Kiss stone's ass"]

class tuesdayViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var Time2: UILabel!
    
    @IBOutlet weak var Event2: UILabel!
    @IBOutlet weak var tuesble: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list2.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell2")
        cell2.textLabel?.text = listfortime2[indexPath.row] + "               " + list2[indexPath.row]
        return(cell2)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            list2.remove(at: indexPath.row)
            tuesble.reloadData()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        tuesble.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
