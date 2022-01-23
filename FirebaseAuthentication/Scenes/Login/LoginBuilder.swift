//
//  LoginBuilder.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import UIKit

final class LoginBuilder {
    static func make() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        
        return viewController
    }
}
