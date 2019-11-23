//
//  Common.swift
//  275_test
//
//  Created by Evan Lee on 2019-11-22.
//  Copyright © 2019 Sterling Smith. All rights reserved.
//

import Foundation

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
