//
//  DocProfileViewController.swift
//  275_test
//
//  Created by Sterling Smith on 2019-11-14.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit

class DocProfileViewController: UIViewController {

    @IBOutlet weak var docname: UILabel!
    @IBOutlet weak var docprofession: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        docname.text = Variables.firstname
        docprofession.text = Variables.docprofession

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
