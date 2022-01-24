//
//  SignUpContracts.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 24.01.2022.
//

import Foundation

protocol SignUpViewModelProtocol {
    var delegate: SignUpViewModelDelegate? { get set }
    func load()
    func setTitle()
    func createUser(email: String, password: String)
}

enum SignUpViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
}

enum SignUpRoute {
    case showAlert(AlertStatus)
}

protocol SignUpViewModelDelegate {
    func handleOutput(_ output: SignUpViewModelOutput)
    func navigate(to route: SignUpRoute)
}

enum AlertStatus {
    case success
    case error
}
