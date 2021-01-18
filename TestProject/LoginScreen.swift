//
//  LoginScreen.swift
//  TestProject
//
//  Created by Xenia Sidorova on 18.01.2021.
//

import UIKit

class LoginScreen : UIViewController {
    let loginTextField = CustomField()
    let passwordTextField = CustomField()
    let signInButton = UIButton()
    var signSwitch = UISwitch()
    let signLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login screen"
        view.backgroundColor = .systemGray6

        setupLoginTextField()
        setupPasswordTextField()
        setupSignInButton()

    }

    public func loginTextFieldText(name: String?) -> String? {
        let name = loginTextField.text
        return name
    }

    func setupLoginTextField() {
        loginTextField.placeholder = "Enter login"
        loginTextField.frame = CGRect(x: 50, y: view.frame.height/3, width: view.frame.width - 100, height: 31)

        view.addSubview(loginTextField)
    }

    func setupPasswordTextField() {
        passwordTextField.placeholder = "Enter password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.frame = CGRect(x: 50, y: view.frame.height/2.5, width: view.frame.width - 100, height: 31)

        view.addSubview(passwordTextField)
    }
    @objc func performMap(parametrSender: Any) {
        let mapScreenController = MapScreen()
        mapScreenController.userName = loginTextField.text
        loginTextField.text = ""
        passwordTextField.text = ""
        navigationController?.pushViewController(mapScreenController, animated: true)
    }

    private func setupSignInButton(){
        signInButton.backgroundColor = .systemPurple
        signInButton.tintColor = .white
        signInButton.layer.cornerRadius = 5
        signInButton.setTitle("Sign in", for: .normal)
        signInButton
            .frame = CGRect(x: 50, y: view.frame.height/2 + 150, width: view.frame.width - 100, height: 40)
        signInButton
            .addTarget(self, action: #selector(performMap(parametrSender:)), for: .touchUpInside)

        view.addSubview(signInButton)
    }
}

