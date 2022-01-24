//
//  MainBuilder.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import Foundation
import UIKit

final class MainBuilder {
    static func make() -> MainViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        
        return viewController
    }
}
