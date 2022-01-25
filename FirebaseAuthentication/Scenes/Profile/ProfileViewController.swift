//
//  ProfileViewController.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var viewModel: ProfileViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.load()
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        viewModel.logout()
    }
    
}

extension ProfileViewController: ProfileViewModelDelegate {
    func handleOutput(_ output: ProfileViewModelOutput) {
        switch output {
            case .setTitle(let string):
                title = string
            case .setLabels(let email, let username):
                emailLabel.text = email
                usernameLabel.text = username
        }
    }
    
    func navigate(to route: ProfileViewRoute) {
        switch route {
            case .login:
                self.tabBarController?.selectedIndex = 0
                emailLabel.text = ""
                usernameLabel.text = ""
                
                
        }
    }
    
    
}
