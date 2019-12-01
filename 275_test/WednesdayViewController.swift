//
//  WednesdayViewController.swift
//  275_test
//
//  Created by MICHAEL on 2019-11-29.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import UIKit
class WednesdayViewController:UIViewController{
    
    
    override func viewDidLoad() {
        
        
        getMedicationSchedule( dayOfTheWeek: "Wednesday", completion:
            {
                
                DataDic in
                
                var TimeArray = [String]()
                var EventArray = [String]()
                
                for (TimeSet, EventSet) in DataDic
                {
                    TimeArray.append(TimeSet)
                    EventArray.append(EventSet)
                    
                    
                }
                for i in 0...TimeArray.count-1 //sorting the two arrays
                {
                    var minOfTime = TimeArray[i]
                    if(i==TimeArray.count-1)
                    {
                        break
                    }
                    for j in i+1...TimeArray.count-1
                    {
                        if(TimeArray[j]<minOfTime)
                        {
                            let temp1=TimeArray[j]
                            TimeArray[j]=TimeArray[i]
                            TimeArray[i]=temp1
                            minOfTime=temp1
                            let temp2=EventArray[i]
                            EventArray[i]=EventArray[j]
                            EventArray[j]=temp2
                        }
                    }
                    
                }
                /*for i in 0...TimeArray.count-1
                {
                    print(TimeArray[i])
                    print(EventArray[i])
                }*/
                let label_day=UILabel(frame: CGRect(x:0, y:0, width: 250, height:100))
                label_day.center = CGPoint(x:(200), y:(150))
                label_day.textAlignment = .center
                label_day.text = "Wednesday"
                label_day.font = label_day.font.withSize(30)
                self.view.addSubview(label_day)
                
                
                for i in 0...TimeArray.count-1
                {
                    
                    let label1_1=UILabel(frame: CGRect(x:0, y:0, width: 250, height:100))
                    label1_1.center = CGPoint(x:(150), y:(50*i+250))
                    label1_1.textAlignment = .left
                    label1_1.text = TimeArray[i]
                    label1_1.font = label1_1.font.withSize(20)
                    self.view.addSubview(label1_1)
                    
                }
                
                for i in 0...EventArray.count-1
                {
                    
                    let label1_1=UILabel(frame: CGRect(x:0, y:0, width: 250, height:100))
                    label1_1.center = CGPoint(x:(250), y:(50*i+250))
                    label1_1.textAlignment = .left
                    label1_1.text = EventArray[i]
                    label1_1.font = label1_1.font.withSize(20)
                    self.view.addSubview(label1_1)
                    
                }
                
                
                
        })
        
        
        
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
