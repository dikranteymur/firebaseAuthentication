//
//  LoginBuilder.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import UIKit

final class LoginBuilder {
    static func make() -> LoginNavigationController {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "LoginNavigationController") as! LoginNavigationController
        if let vc = navigationController.viewControllers.first as? LoginViewController {
            vc.viewModel = LoginViewModel()
        }
        
        return navigationController
    }
}
