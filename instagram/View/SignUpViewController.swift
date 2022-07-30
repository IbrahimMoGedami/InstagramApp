//
//  SignUpViewController.swift
//  instagram
//
//  Created by Ibrahim Mo Gedami on 7/29/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.anchor(width: 140, height: 140)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "add_photo")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.anchor(height: 50)
        tf.keyboardType = .emailAddress
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        return tf 
    }()
    
    let userNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .alphabet
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        return tf
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        [plusPhotoButton].forEach({
            view.addSubview($0)
            if $0 == plusPhotoButton{
                $0.center = view.center
                $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                $0.anchor(top: view.topAnchor, paddingTop: 20)
            }
        })
        setupStackViews()
    }
    
    @objc private func textFieldDidChanged() {
        let isValidEmail = emailTextField.text?.count ?? 0 > 0 &&
        userNameTextField.text?.count ?? 0 > 0 &&
        passwordTextField.text?.count ?? 0 > 0
        
        if isValidEmail {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237, alpha: 1)
        }else{
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244, alpha: 1)
        }
        [emailTextField, passwordTextField, userNameTextField].forEach({_ in
            
        })
    }
    
    private func setupStackViews() {
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, userNameTextField, signUpButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        stackView.anchor(top: plusPhotoButton.bottomAnchor, bottom: nil, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 40, paddingRight: 40)
    }
    
    @objc func signUpButtonTapped() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else {return}
        print(email + "" + password)
        Auth.auth().createUser(withEmail: email, password: password) { (response, error) in
//            guard let self = self,
//                  let response = response,
//                  let error = error
//            else {return}
            print(response?.user.uid)
            
        }
    }
}

