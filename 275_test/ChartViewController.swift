/* https://medium.com/@leonardnguyen/build-your-own-chart-in-ios-part-1-bar-chart-e1b7f4789d70 */

import UIKit
import Firebase
import FirebaseDatabase


class ChartViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        //let dateAndScoreDic: Dictionary<String, String>=getTremorScores()
        //print("we are getting the data")
        getTremorScores(completion: {dateAndScoreDic in
            //print(dateAndScoreDic)
            
            
            
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            let currentFullDate = formatter.string(from: date)
            //print(result)
            
            
            //get the current dates
            let monthOfText = currentFullDate.index(currentFullDate.startIndex, offsetBy: 0)
            let monthEndOfText = currentFullDate.index(currentFullDate.endIndex, offsetBy: -8)
            let dayOfText = currentFullDate.index(currentFullDate.startIndex, offsetBy: 3)
            let dayEndOfText = currentFullDate.index(currentFullDate.endIndex, offsetBy: -5)
            let yearEndOfText = currentFullDate.index(currentFullDate.startIndex, offsetBy: 6)
            let currentMonth=currentFullDate[monthOfText..<monthEndOfText]
            let currentDay=currentFullDate[dayOfText..<dayEndOfText]
            let currentyear=currentFullDate[yearEndOfText...]
            /*print("the current month is : ",currentMonth)
             print("the current day is : ",currentDay)
             print("the current yaer is : ",currentyear)
             print(currentMonth+"-"+currentDay+"-"+currentyear)*/
            
            
            
            
            
            
            var dateArray = [String]()
            var scoreArray = [Double]()
            var previousTemp = "1"
            var currentTemp = "2"
            var tempDatas=0.0
            for (measuredDate,measeredScore) in dateAndScoreDic
            {
                
                var measuredDateArr = measuredDate.components(separatedBy: " ")
                currentTemp=measuredDateArr[0]
                if(currentTemp==previousTemp)
                {
                    continue
                }
                else
                {
                    dateArray.append(measuredDateArr[0])
                    tempDatas=(Double(measeredScore) ?? 0.0)
                    scoreArray.append(Double(round(1000*tempDatas)/1000))
                    previousTemp=currentTemp
                }
            }
            //print(dateArray)
            //print(scoreArray)
            
            
            var fixedDictionary = Dictionary<String, Double>()
            for index in 0...(dateArray.count-1)
            {
                fixedDictionary[dateArray[index]]=scoreArray[index]
            }
            
            
            //print(fixedDictionary)
            
            var currentMonthArray = [String]()
            var daysInAMonth=0
            
            let monthOf31 = ["01","03","05","07","08","10","12"]
            let monthOf30 = ["04","06","09","11"]
            if (monthOf31.contains(String(currentMonth)))
            {
                daysInAMonth=31
            }
            else if(monthOf30.contains(String(currentMonth)))
            {
                daysInAMonth=30
            }
            else
            {
                if((Int(currentyear) ?? 0)%4==0)
                {
                    daysInAMonth=29
                }
                else
                {
                    daysInAMonth=28
                }
                
            }
            var tempString=""
            for i in 1...daysInAMonth
            {
                if(i<10)
                {
                    tempString="0"+String(i)
                    currentMonthArray.append(currentMonth+"-"+tempString+"-"+currentyear)
                }
                else
                {
                    currentMonthArray.append(currentMonth+"-"+String(i)+"-"+currentyear)
                }
            }
            
            
            
            let chart = BasicBarChart(frame: CGRect(x: 0, y: 320, width: 400, height: 500))
            var dataEntries: Array<DataEntry> = Array(repeating: DataEntry(color: UIColor.red, height: 0.0, textValue: "0.000", title: "future"), count: daysInAMonth)
            /*var dataEntries = [
             
             DataEntry(color: UIColor.red, height: 0.25, textValue: "20", title: "Some title"),
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
             
             ]*/
            //get the current date
            
            //print(currentMonthArray)
            
            var counter=0
            var tempScore=Double(round(0.0*1000)/1000)
            print(String(format:"%f",tempScore))
            var stringEndOfText = currentFullDate.index(currentFullDate.endIndex, offsetBy: -1)
            var tempTextValue="0"
            
            for tempDate in currentMonthArray
            {
                if (tempDate>currentFullDate)
                {
                    break
                }
                if (dateArray.contains(tempDate))
                {
                    tempTextValue = String(format:"%f",fixedDictionary[tempDate] ?? 0.0)
                    stringEndOfText = tempTextValue.index(tempTextValue.endIndex, offsetBy: -4)
                    tempTextValue = String(tempTextValue[...stringEndOfText])
                    dataEntries[counter]=DataEntry(color: UIColor.green, height: Float((fixedDictionary[tempDate] ?? 0.0)/10.0), textValue: tempTextValue, title: currentMonth+"-"+String(counter+1))
                    tempScore=fixedDictionary[tempDate] ?? 0.0
                    counter+=1
                    
                }
                else{
                    tempTextValue = String(format:"%f",tempScore)
                    //print("tempTextValue in else is: ",tempTextValue)
                    stringEndOfText = tempTextValue.index(tempTextValue.endIndex, offsetBy: -4)
                    tempTextValue = String(tempTextValue[...stringEndOfText])
                    dataEntries[counter]=DataEntry(color: UIColor.red, height: Float(tempScore/10.0), textValue: tempTextValue, title: currentMonth+"-"+String(counter+1))
                    counter+=1
                }
            }
            
            
            
            chart.updateDataEntries(dataEntries: dataEntries, animated: true)
            self.view.addSubview(chart) // Assuming that you are writing this code inside a view controller
            
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 21))
            label.center = CGPoint(x: 160, y: 285)
            label.textAlignment = .center
            let averageText="The average score is:"
            var sum=0.0
            for i in scoreArray
            {
                sum+=i
            }
            sum=sum/Double(scoreArray.count)
            print(sum)
            
            let averageScore=String(sum)
            label.text = averageText+averageScore
            self.view.addSubview(label)
        })
        
        
        
        
        
        /*let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
         label.center = CGPoint(x: 160, y: 285)
         label.textAlignment = .center
         let averageText="The average score is:"
         let averageScore="6"
         label.text = averageText+averageScore
         self.view.addSubview(label)
         
         
         
         let chart = BasicBarChart(frame: CGRect(x: 0, y: 320, width: 500, height: 500))
         let dataEntries = [
         DataEntry(color: UIColor.red, height: 0.25, textValue: "20", title: "Some title"),
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
         self.view.addSubview(chart) // Assuming that you are writing this code inside a view controller*/
        
    }
    
    
    func getTremorScores(completion: @escaping(_ data:[String:String]) -> Void) {
        let ref : DatabaseReference! = Database.database().reference()
        var dateAndTremorScore : [String: String]!
        //var isDataExist=false
        //print(ref.child("Users").child(Firebase.Auth.auth().currentUser!.uid).child("TremorScores"))
        ref.child("Users").child(Firebase.Auth.auth().currentUser!.uid).child("TremorScores").observeSingleEvent(of: .value, with: { (snapshot) in
            
            if (snapshot.exists()) {
                //isDataExist=true
                dateAndTremorScore = (snapshot.value as! [String: String])
                completion(dateAndTremorScore)
            }
            else{completion(["-1":"-1"])}
        })
        
    }
}












