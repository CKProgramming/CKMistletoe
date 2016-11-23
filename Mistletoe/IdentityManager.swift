//
//  IdentityManager.swift
//  Mistletoe
//
//  Created by Zach Kobes on 11/22/16.
//  Copyright © 2016 Zach. All rights reserved.
//

import Foundation

class IdentityManager: NSObject {
    var token: String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "token")
        }
        get {
            return UserDefaults.standard.string(forKey: "token")
        }
    }
}
