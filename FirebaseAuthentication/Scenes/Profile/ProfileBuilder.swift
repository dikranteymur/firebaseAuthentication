//
//  ProfileBuilder.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import Foundation
import UIKit

final class ProfileBuilder {
    static func make() -> ProfileViewController {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        return viewController
    }
}
