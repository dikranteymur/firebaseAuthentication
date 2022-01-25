//
//  LoginViewController.swift
//  FirebaseAuthentication
//
//  Created by Dikran Teymur on 22.01.2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!
    
    let auth = Auth.auth()
    
    var viewModel: LoginViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }
    
//    @objc func keyboardWillShow(sender: NSNotification) {
//        self.view.frame.origin.y -= 150
//    }
//
//    @objc func keyboardWillHide(sender: NSNotification) {
//        self.view.frame.origin.y += 150
//    }
    
    func setupUI() {
        if let signUpText = signUpLabel.text {
            let attibuteString = NSMutableAttributedString(string: signUpText)
            let nsRange = NSString(string: signUpText).range(of: "Sign Up.")
            attibuteString.addAttributes([.foregroundColor : UIColor.red], range: nsRange)
            signUpLabel.attributedText = attibuteString
            
            // Sign Up: add gesture
            signUpLabel.isUserInteractionEnabled = true
            let gesture = UITapGestureRecognizer(target: self, action: #selector(tapSignUpLabel))
            signUpLabel.addGestureRecognizer(gesture)
            
        }
    }
    
    @objc func tapSignUpLabel() {
        let vc = SignUpBuilder.make()
        show(vc, sender: self)
    }
    
    @IBAction func signInButton(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            viewModel.signIn(email: email, password: password)
        }
    }
    
    
}

extension LoginViewController: LoginViewModelDelegate {
    func handleOutput(_ output: LoginViewModelOutput) {
        switch output {
            case .updateTitle(let string):
                title = string
            case .isLoading(let bool):
                print("isLoading: \(bool)")
            case .loginResult(let alertStatus):
                alert(status: alertStatus)
        }
    }
    
    func navigate(to route: LoginViewRoute) {
        switch route {
            case .showAlert(let alertStatus):
                alert(status: alertStatus)
            case .signIn:
                print("giris yapildi")
            case .signUp:
                print("cikis yapildi")
        }
    }
    
    
}


extension LoginViewController {
    private func alert(status: AlertStatus) {
        
        let alertController = UIAlertController(title: status == .success ? "Basarili" : "Basarisiz", message: status == .success ? "Giris Yapildi" : "Email veya sifrenizi kontrol ediniz", preferredStyle: .alert)
        let action = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}


