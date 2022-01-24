//
//  SignUpViewController.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 23.01.2022.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let auth = Auth.auth()
    
    var viewModel: SignUpViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.setTitle()
        
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            viewModel.createUser(email: email, password: password)
        }
    }
    

}

extension SignUpViewController: SignUpViewModelDelegate {
    func handleOutput(_ output: SignUpViewModelOutput) {
        switch output {
            case .updateTitle(let string):
                title = string
            case .setLoading(let bool):
                print("Is Loading: \(bool)")
        }
    }
    
    func navigate(to route: SignUpRoute) {
        switch route {
            case .showAlert(let alertStatus):
                alert(status: alertStatus)
        }
    }
    
    
}

extension SignUpViewController {
    private func alert(status: AlertStatus) {
        
        let alertController = UIAlertController(title: status == .success ? "Basarili" : "Basarisiz", message: status == .success ? "Giris Yapildi" : "Email veya sifrenizi kontrol ediniz", preferredStyle: .alert)
        let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
