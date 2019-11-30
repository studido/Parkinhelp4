//
//  SaturdayViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-29.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

var listfortime6 = ["12:00","13:00","14:00","15:00"]
var list6 = ["Take some med1","Do some sport2","Eat some fruit3","Kiss stone's ass"]

class SaturdayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
        
        
    @IBOutlet weak var satble: UITableView!
    
        
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return (list6.count)
        }
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell6 = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell6")
            cell6.textLabel?.text = listfortime6[indexPath.row] + "               " + list6[indexPath.row]
            return(cell6)
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete
            {
                list4.remove(at: indexPath.row)
                satble.reloadData()
            }
        }
        
        
        override func viewDidAppear(_ animated: Bool) {
            
            satble.reloadData()
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
