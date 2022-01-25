//
//  LoginViewModel.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import Foundation
import Firebase

final class LoginViewModel: LoginViewModelProtocol {
    var delegate: LoginViewModelDelegate?
    private var auth = Auth.auth()
    
    init() { }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let _ = error {
                self.delegate?.handleOutput(.loginResult(.error))
            } else {
                self.delegate?.handleOutput(.loginResult(.success))
            }
        }
    }
}
