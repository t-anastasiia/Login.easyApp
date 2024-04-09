//
//  ViewController.swift
//  Login
//
//  Created by Анастасия Талмазан on 2024-04-06.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureButtons(loginButton)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }
    
    // MARK: Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordFullnessScale: UIView!
    @IBOutlet weak var emailFullnessScale: UIView!
    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    
    // MARK: Properties
    private let mainColor = UIColor(named: "login") ?? UIColor.darkGray
    private var email = ""
    private var password = ""
    
    private let mockEmail = "abc@gmail.com"
    private let mockPassword = "1aA!aa"
    
    // MARK: Actions
    @IBAction func login(_ sender: Any) {
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        
        if email.isEmpty { makeErrorField(for: emailTextField)}
        if password.isEmpty { makeErrorField(for: passwordTextField)}
        
        if email == mockEmail, password == mockPassword
        {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized, message: "Wrong password or e-mail".localized, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .destructive)
            alert.addAction(action)
            
            present(alert, animated: true)
        }
    }
    
    @IBAction func singUp(_ sender: Any) {
        print("u wanna sing up")
    }
    
    // MARK: Methods
    private func configureButtons(_ sender: UIButton)
    {
        sender.layer.shadowRadius = 6
        sender.layer.shadowOpacity = 0.8
        sender.layer.shadowOffset = CGSize(width: 3, height: 3)
        sender.layer.shadowColor = mainColor.cgColor
    }

    private func makeErrorField(for textField: UITextField)
    {
        switch textField
        {
            case emailTextField:
                emailFullnessScale.backgroundColor = .systemRed
            case passwordTextField:
                passwordFullnessScale.backgroundColor = .systemRed
            default:
                print("Oopsi")
        }
    }
}

// MARK: Extensions

extension ViewController: UITextFieldDelegate
{
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text?.trimmingCharacters(in:     .whitespacesAndNewlines), !text.isEmpty else { return }
        switch textField
        {
            case emailTextField:
                if text.isValidEmail
                {
                    email = text
                    emailFullnessScale.backgroundColor = .systemGreen
                } else {
                    makeErrorField(for: emailTextField)
                }
            case passwordTextField:
                if text.isValidPassword
                {
                    password = text
                    passwordFullnessScale.backgroundColor = .systemGreen
                } else {
                    makeErrorField(for: passwordTextField)
                }
            default:
                print(text)
        }
        
    }
}

extension String
{
    var isValidEmail: Bool 
    {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    var isValidPassword: Bool
    {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$#!%*?&]).{6,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: self)
    }
}
