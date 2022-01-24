//
//  SignUpBuilder.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 24.01.2022.
//

import Foundation

final class SignUpBuilder {
    static func make() -> SignUpViewController {
        let viewController = SignUpViewController(nibName: "SignUpView", bundle: nil)
        viewController.viewModel = SignUpViewModel()
        return viewController
    }
}
