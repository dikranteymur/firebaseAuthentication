//
//  LoginContracts.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import Foundation

protocol LoginViewModelProtocol {
    var delegate: LoginViewModelDelegate? { get set }
    func signIn(email: String, password: String)
}

enum LoginViewModelOutput {
    case updateTitle(String)
    case isLoading(Bool)
    case loginResult(AlertStatus)
}

enum LoginViewRoute {
    case showAlert(AlertStatus)
    case signIn
    case signUp
}

protocol LoginViewModelDelegate {
    func handleOutput(_ output: LoginViewModelOutput)
    func navigate(to route: LoginViewRoute)
}
