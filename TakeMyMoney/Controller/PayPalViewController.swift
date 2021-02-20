//
//  PayPalViewController.swift
//  TakeMyMoney
//
//  Created by Claudia Maciel on 2/11/21.
//

import UIKit

class PayPalViewController: UIViewController {
    
    //MARK:- IBOutlets

    @IBOutlet var emailAddressTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var userName = ""
    var PPpassword = ""
    
    var payPal: PayPal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkEmptyFields() {
        // check the email address
        if let emailAddress = emailAddressTextField.text, !emailAddress.isEmpty {
            emailAddressTextField.placeholder = ""
            emailAddressTextField.layer.borderWidth = 0.0
            emailAddressTextField.layer.borderColor = UIColor.clear.cgColor
            
            userName = emailAddress
        } else {
            emailAddressTextField.layer.borderColor = UIColor.red.cgColor
            emailAddressTextField.layer.borderWidth = 1.0
            emailAddressTextField.attributedPlaceholder = NSAttributedString(string: "Please Enter a Valid Email Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            emailAddressTextField.text = ""
        }
        
        // check the password
        if let password = passwordTextField.text, !password.isEmpty {
            passwordTextField.placeholder = ""
            passwordTextField.layer.borderWidth = 0.0
            passwordTextField.layer.borderColor = UIColor.clear.cgColor
            PPpassword = password
        } else {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 1.0
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Please Enter a Valid Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            passwordTextField.text = ""
        }
        
        payPal = PayPal(username: userName, password: PPpassword)
    }
}
