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
            let gesture = UITapGestureRecognizer(target: self, action: #selector(tapSighUpLabel))
            signUpLabel.addGestureRecognizer(gesture)
            
        }
    }
    
    @objc func tapSighUpLabel() {
        print("Uye ol")
//        let viewController = SignUpViewController(nibName: "SignUpView", bundle: nil)
        let vc = SignUpBuilder.make()
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func signInButton(_ sender: Any) {
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            checkUser(email: email, password: password)
        }
    }
    
    private func checkUser(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error  in
            if let error = error {
                self.alert(status: .error)
                print("error: \(error)")
            } else {
                self.alert(status: .success)
                print("result: \(String(describing: result))")
            }
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


