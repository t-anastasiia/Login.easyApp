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
    }
    
    // MARK: Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet var textFieldCollection: [UITextField]!
    @IBOutlet var fullnessScaleCollection: [UIView]!
    @IBOutlet weak var singUpButton: UIButton!
    
    // MARK: Actions
    @IBAction func login(_ sender: Any) {
        print("u wanna login")
    }
    
    @IBAction func singUp(_ sender: Any) {
        print("u wanna sing up")
    }
    
    // MARK: Methods
    private func configureButtons(_ sender: UIButton)
    {
        sender.layer.shadowRadius = 6
        sender.layer.shadowOpacity = 0.3
        sender.layer.shadowOffset = CGSize(width: 3, height: 3)
        sender.layer.shadowColor = UIColor.darkGray.cgColor
    }

}

