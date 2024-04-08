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
        
    }
    
    // MARK: Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var fullnessScaleCollection: [UIView]!
    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    
    // MARK: Actions
    @IBAction func login(_ sender: Any) {
        performSegue(withIdentifier: "goToHomePage", sender: sender)
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
        sender.layer.shadowColor = (UIColor(named: "login") ?? UIColor.darkGray).cgColor
    }

}

extension ViewController: UITextFieldDelegate
{
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text?.trimmingCharacters(in:     .whitespacesAndNewlines) else { return }
        switch textField
        {
            case emailTextField:
                print(text.isValidEmail)
            case passwordTextField:
                print(text)
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
    
//    var isValidPassword: Bool
//    {
//        let 
//    }
}
