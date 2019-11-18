//
//  ViewController.swift
//  BarChart
//
//  Created by Nguyen Vu Nhat Minh on 19/8/17.
//  Copyright © 2017 Nguyen Vu Nhat Minh. All rights reserved.
//

import UIKit


class ChartViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let chart = BasicBarChart(frame: CGRect(x: 0, y: 160, width: 500, height: 200))
        let dataEntries = [
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title"),
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title"),
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title"),
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title"),
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title"),
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title"),
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title"),
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title"),
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title"),
            DataEntry(color: UIColor.red, height: 0.2, textValue: "20", title: "Some title"),
            DataEntry(color: UIColor.green, height: 0.7, textValue: "70", title: "Some title")
            
        ]
        chart.updateDataEntries(dataEntries: dataEntries, animated: true)
        self.view.addSubview(chart) // Assuming that you are writing this code inside a view controller
        
    }
    
    

}

