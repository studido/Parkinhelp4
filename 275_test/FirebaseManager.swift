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
    var FBManager: DatabaseReference?
    static var uid : String?

    public init() {
    }
    
    func initialze() {
        FBManager = Database.database().reference()
    }

    
    public func saveScore() {
        FBManager?.child("Users").child("id3").setValue(["Full name": "oon"])
    }
}



