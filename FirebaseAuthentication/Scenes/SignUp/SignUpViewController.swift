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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            auth.createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    self.alert(status: .error)
                    print("error: \(error)")
                } else {
                    self.alert(status: .success)
                }
            }
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
