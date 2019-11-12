//
//  FirebaseManager.swift
//  275_test
//
//  Created by Evan Lee on 2019-11-10.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import Foundation
import FirebaseDatabase

//FBManager maintains a single connection to the same URL by default (singleton)
class FirebaseManager {
    var FBManager: DatabaseReference!
    
    static var patient : String!
    static var uid : String!
    static var age : String!
    static var fullName : String!
    static var gender : String!
    static var doctors : [(uid: String, fullName: String)]!
    static var tremors : [(date: String, score: String)]!
    static var survey : [(question: String, answer: String)]!
    static var patients : [(uid: String, fullName: String)]!
    

    public init() {
    }

    //seperate func to initialize database reference to avoid firebase configuration error
    public func initialze() {
        FBManager = Database.database().reference()
    }

    
    public func saveScore() {
        FBManager.child("Users").child("id3").setValue(["Full name": "oon"])
    }
}



