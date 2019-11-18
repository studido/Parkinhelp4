//
//  _75_testTests.swift
//  275_testTests
//
//  Created by Sterling Smith on 10/29/19.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import XCTest
import Firebase
import FirebaseDatabase
@testable import _75_test


class _75_testTests: XCTestCase {
    override class func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        FirebaseApp.configure()
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadAndWriteToDatabase() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let firstName = "john"
        let lastName = "doe"
        let weight = "170"
        let age = "79"
        let height = "180"
        let gender = "male"
        let dateOfBirth = "12-10/1855"
        let contactNumber = "6042339505"
        let durationOfDisease = "41"
        let repetitions = "2"
        let intensity = "3"
        let email = "johndoe@gmail.com"
        let userType = "patient"
        
        let ref : DatabaseReference! = Database.database().reference()
        let userData = ["firstName": firstName,
                        "lastName":  lastName,
                        "weight":  weight,
                        "age":  age,
                        "height":  height,
                        "gender":  gender,
                        "dateOfBirth":  dateOfBirth,
                        "contactNumber":  contactNumber,
                        "durationOfDisease":  durationOfDisease,
                        "repetitions":  repetitions,
                        "intensity":  intensity,
                        "email" : email,
                        "userType": userType]
        
        let uid = "dummy_uid"
        ref.updateChildValues(["/Users/\(uid)" : userData])
        
    ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
        XCTAssertTrue(snapshot.exists())
        let value = snapshot.value as! [String: Any]
        XCTAssertEqual(firstName, value["firstName"] as? String ?? "")
        XCTAssertEqual(lastName, value["lastName"] as? String ?? "")
        XCTAssertEqual(age, value["age"] as? String ?? "")
        XCTAssertEqual(weight, value["weight"] as? String ?? "")
        XCTAssertEqual(height, value["height"] as? String ?? "")
        XCTAssertEqual(gender, value["gender"] as? String ?? "")
        XCTAssertEqual(contactNumber, value["contactNumber"] as? String ?? "")
        XCTAssertEqual(durationOfDisease, value["durationOfDisease"] as? String ?? "")
        XCTAssertEqual(email, value["email"] as? String ?? "")
        XCTAssertEqual(userType, value["userType"] as? String ?? "")
        XCTAssertEqual(dateOfBirth, value["dateOfBirth"] as? String ?? "")
        XCTAssertEqual(repetitions, value["repetitions"] as? String ?? "")
        XCTAssertEqual(intensity, value["intensity"] as? String ?? "")
        
        })
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
