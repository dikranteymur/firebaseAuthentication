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

        
        
    }
    
    private func allViews() {
        let loginScreen = LoginBuilder.make()
        
        
        
        
        viewControllers?.append(loginScreen)
    }


}
