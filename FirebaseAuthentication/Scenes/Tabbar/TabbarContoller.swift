//
//  TabbarContoller.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import UIKit

class TabbarContoller: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initVC()
        
    }
    
    private func initVC() {
        let loginScreen = LoginBuilder.make()
        let loginItem = UITabBarItem(title: "Login", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        loginScreen.tabBarItem = loginItem
        
        let mainScreen = MainBuilder.make()
        let mainItem = UITabBarItem(title: "Home", image: UIImage(systemName: "drop"), selectedImage: UIImage(systemName: "drop.fill"))
        mainScreen.tabBarItem = mainItem
        
        let profileScreen = ProfileBuilder.make()
        let profileItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        profileScreen.tabBarItem = profileItem
        
        
        
        viewControllers = [loginScreen, mainScreen, profileScreen]
    }


}
