//
//  UserdefaultExtension.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 23.01.2022.
//

import Foundation

struct User {
    var name: String
    var surname: String
    var email: String
    var password: String
}

extension UserDefaults {
    enum Status: String {
        case username = "username"
        case email = "email"
        case password = "password"
        
        var name: String {
            get {
                return self.rawValue
            }
        }
    }
    
    class var username: String {
        get {
            return UserDefaults.standard.string(forKey: Status.username.name) ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: Status.username.name)
        }
    }
    
    class var email: String {
        get {
            return UserDefaults.standard.string(forKey: Status.email.name) ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: Status.email.name)
        }
    }
    
    class var password: String {
        get {
            return UserDefaults.standard.string(forKey: Status.password.name) ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: Status.password.name)
        }
    }
}
