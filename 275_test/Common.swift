//
//  Common.swift
//  275_test
//
//  Created by Evan Lee on 2019-11-22.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import Foundation
import FirebaseDatabase

func sha256(data : Data) -> Data {
    var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
    data.withUnsafeBytes {
        _ = CC_SHA256($0, CC_LONG(data.count), &hash)
    }
    return Data(bytes: hash)
}

func getSha256(string : String) -> String {
    let shad256 = sha256(data: string.data(using: String.Encoding.utf8)!)
    return shad256.compactMap { String(format: "%02x", $0) }.joined()
}

func getStrDate() -> String {
    let timestamp:Date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
    return dateFormatter.string(from: timestamp)
}

func getDateObject(strDate : String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale.current
    return dateFormatter.date(from: strDate) ?? Date()
    
}

func getMedicationSchedule(dayOfTheWeek : String, completion: @escaping(_ data:[String:String]) -> Void) {
    let ref : DatabaseReference! = Database.database().reference()
    var medicationSchedule : [String: String]!
    ref.child("Users").child(Variables.medicationId).child("MedicationSchedule").child(dayOfTheWeek).observeSingleEvent(of: .value, with: { (snapshot) in
        
        if (snapshot.exists()) {
            medicationSchedule = (snapshot.value as! [String: String])
            completion(medicationSchedule)
        }
        else{completion([" ":" "])}
    })
}


func getDayofWeek(_ today: String)-> Int? {
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    guard let todayDate = formatter.date(from: today)else{return nil}
    let myCalendar = Calendar(identifier: .gregorian)
    let weekDay = myCalendar.component(.weekday,from: todayDate)
    return weekDay
    
}

func checkValidDayOfWeek(dayOfTheWeek : String) -> Bool {
    if (dayOfTheWeek != "Monday" && dayOfTheWeek != "Tuesday" && dayOfTheWeek != "Wednesday" && dayOfTheWeek != "Thursday" && dayOfTheWeek != "Friday" && dayOfTheWeek != "Saturday" && dayOfTheWeek != "Sunday") {
        return false
    }
    
    return true
}

func checkValidTime(time : String) -> Bool {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "HH:mm a"
    
    if dateFormatterGet.date(from: time) == nil {
        return false
    }
    
    return true
}

// Add event for medication
func addEvent(time : String, event : String, day : String, completion: @escaping(_ data:[String:String]) -> Void) {
    let ref : DatabaseReference! = Database.database().reference()
    var medDict : [String : String]!
    ref.child("Users").child(Variables.medicationId).child("MedicationSchedule").child(day).observeSingleEvent(of: .value, with: { (snapshot) in
        if (snapshot.exists()) {
            medDict = (snapshot.value as! [String: String])
            medDict[time] = event
        } else {
            medDict = [time : event]
        }
        
        ref.updateChildValues(["/Users/\(Variables.medicationId)/MedicationSchedule/\(day)" : medDict])
        completion(medDict)
    })
}

// Delete event for medication
func deleteEvent(time : String, day : String, completion: @escaping(_ data:[String:String]) -> Void) {
    let ref : DatabaseReference! = Database.database().reference()
    var medDict : [String : String]!
    ref.child("Users").child(Variables.medicationId).child("MedicationSchedule").child(day).observeSingleEvent(of: .value, with: { (snapshot) in
        if (snapshot.exists()) {
            medDict = (snapshot.value as! [String: String])
            if (medDict.removeValue(forKey: time) == nil) {
                medDict = ["-1" : "-1"]
            }
            else {
                ref.updateChildValues(["/Users/\(Variables.medicationId)/MedicationSchedule/\(day)" : medDict])
            }
        } else {
            medDict = ["-1" : "-1"]
        }
        
        completion(medDict)
    })
}
