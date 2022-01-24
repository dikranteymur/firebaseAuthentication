//
//  AppRouter.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import UIKit

final class AppRouter {
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
//        let storyboard = UIStoryboard(name: "Login", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        let viewController = TabbarBuilder.make()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
