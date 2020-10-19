//
//  LoginViewController.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 16.10.2020.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    let rootView = LoginView()
    
    init() {
        super.init(nibName: .none, bundle: .none)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        rootView.loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
    }
    
    
    private func setup() {
        
    }
    
    @objc
    private func registerTapped() {
        let email = rootView.loginTextField.text!
        let pwd = rootView.passwordTextField.text!
        
        Auth.auth().createUser(withEmail: email, password: pwd) { [unowned self] (result, error) in
            switch error {
            case let .some(error):
                debugPrint(error.localizedDescription)
            default:
                singIn(withEmail: email, password: pwd) {
                    let mainViewController = MainViewController()
                    navigationController?.pushViewController(mainViewController, animated: true)
                }
            }
        }
    }
    
    @objc
    private func loginTapped() {
        let email = rootView.loginTextField.text!
        let pwd = rootView.passwordTextField.text!
        
        singIn(withEmail: email, password: pwd) { [unowned self] in
            let mainViewController = MainViewController()
            navigationController?.pushViewController(mainViewController, animated: true)
        }
    }
    
    
    private func singIn(withEmail enail: String, password: String, success: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: enail, password: password) { (result, error) in
            switch error {
            case let .some(error):
                debugPrint(error.localizedDescription)
                
            default:
                success()
            }
        }
    }
}
