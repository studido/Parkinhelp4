//
//  WednesdayViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-29.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit
var listfortime3 = ["12:00","13:00","14:00","15:00"]
var list3 = ["Take some med1","Do some sport2","Eat some fruit3","Kiss stone's ass"]

class WednesdayViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var time3: UILabel!
    
    @IBOutlet weak var event3: UILabel!
    
    @IBOutlet weak var wesble: UITableView!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list3.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell3 = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell3")
        cell3.textLabel?.text = listfortime3[indexPath.row] + "               " + list3[indexPath.row]
        return(cell3)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            list3.remove(at: indexPath.row)
            wesble.reloadData()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        wesble.reloadData()
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
