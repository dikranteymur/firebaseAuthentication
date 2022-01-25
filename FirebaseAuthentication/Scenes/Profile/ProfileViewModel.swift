//
//  ProfileViewModel.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import Foundation
import Firebase

final class ProfileViewModel: ProfileViewModelProtocol {
    var delegate: ProfileViewModelDelegate?
    private var auth = Auth.auth()
    
    init() { }
    
    func load() {
        if let user = auth.currentUser {
            if let userEmail = user.email {
                delegate?.handleOutput(.setLabels(userEmail, "dikran"))
                
            }
        } else {
            print("current user yok")
        }
        delegate?.handleOutput(.setTitle("Profile"))
        
    }
    
    func logout() {
        try? auth.signOut()
        delegate?.navigate(to: .login)
    }
    
    
}
