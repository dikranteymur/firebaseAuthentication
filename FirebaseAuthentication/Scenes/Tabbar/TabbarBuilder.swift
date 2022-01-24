//
//  TabbarBuilder.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 23.01.2022.
//

import UIKit

final class TabbarBuilder {
    static func make() -> TabbarContoller {
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TabbarContoller") as! TabbarContoller
        
        return viewController
    }
}
