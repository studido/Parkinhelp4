//
//  DocProfileViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-14.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class DocProfileViewController: UIViewController {

    @IBOutlet weak var myacc: UILabel!
    @IBOutlet weak var docname: UILabel!
    @IBOutlet weak var docprofession: UILabel!
    @IBOutlet weak var whiteback: UIImageView!
    @IBOutlet weak var numpatients: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let stringnumpatient = Variables.numpatient
        whiteback.layer.borderWidth = 1.5
        whiteback.layer.cornerRadius = 15
        myacc.layer.borderWidth = 1.5
        myacc.layer.cornerRadius = 15
        docname.text = Variables.firstname
        docprofession.text = Variables.docprofession
        print(stringnumpatient)
        numpatients.text = stringnumpatient
       

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
