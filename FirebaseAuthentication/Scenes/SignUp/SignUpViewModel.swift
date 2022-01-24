//
//  SignUpViewModel.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 24.01.2022.
//

import Foundation
import Firebase

final class SignUpViewModel: SignUpViewModelProtocol {
    var delegate: SignUpViewModelDelegate?
    private var auth = Auth.auth()
    
    init() { }
    
    func load() {
        
    }
    
    func setTitle() {
        delegate?.handleOutput(.updateTitle("Sign Up"))
    }
    
    func createUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] (result, error) in
            if let _ = error {
                self?.delegate?.navigate(to: .showAlert(.error))
            } else {
                self?.delegate?.navigate(to: .showAlert(.success))
            }
        }
    }
    
    
}
