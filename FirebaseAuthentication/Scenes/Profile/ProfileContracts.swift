//
//  ProfileContracts.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import Foundation

protocol ProfileViewModelProtocol {
    var delegate: ProfileViewModelDelegate? { get set }
    func load()
    func logout()
}

enum ProfileViewModelOutput {
    case setTitle(String)
    case setLabels(String, String)
}

enum ProfileViewRoute {
    case login
}

protocol ProfileViewModelDelegate {
    func handleOutput(_ output: ProfileViewModelOutput)
    func navigate(to route: ProfileViewRoute)
}
