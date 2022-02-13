//
//  Session.swift
//  Github
//
//  Created by Lorena Astalis on 11.02.2022.
//

import Foundation
import OctoKit

struct Session {
    
    static var instance = Session()
    
    private init () {
        
    }
    
    var authToken: String? {
        get {
            UserDefaults.standard.string(forKey: "authToken")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "authToken")
        }
    }
    
    var user: User? {
        get {
            UserDefaults.standard.object(forKey: "user") as? User
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "user")
        }
    }
    
    var isValidSession: Bool {
        return authToken != nil
    }
}
