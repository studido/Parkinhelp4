//
//  FridayViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-29.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit


var listfortime5 = ["12:00","13:00","14:00","15:00"]
var list5 = ["Take some med1","Do some sport2","Eat some fruit3","Kiss stone's ass"]

class FridayViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    @IBOutlet weak var frible: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list5.count)
    }
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell5 = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell5")
            cell5.textLabel?.text = listfortime5[indexPath.row] + "               " + list5[indexPath.row]
            return(cell5)
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == UITableViewCell.EditingStyle.delete
            {
                list5.remove(at: indexPath.row)
                frible.reloadData()
            }
        }
        
        
        override func viewDidAppear(_ animated: Bool) {
            
           frible.reloadData()
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
