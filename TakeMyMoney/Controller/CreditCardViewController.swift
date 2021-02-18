//
//  CreditCardViewController.swift
//  TakeMyMoney
//
//  Created by Claudia Maciel on 2/11/21.
//

import UIKit

class CreditCardViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet var CardNumberTextField: UITextField!
    @IBOutlet var CVVTextField: UITextField!
    @IBOutlet var CardHolderNameTextField: UITextField!
    @IBOutlet var DatePickerTextField: UITextField!
    
    let datePicker = MonthYearPickerView()
    var cardHolderName = ""
    var cardNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DatePickerTextField.inputView = datePicker
        dismissPickerView()
        CardNumberTextField.delegate = self
    }

    // MARK: - IBAction
    @IBAction func SaveCardForFutureSwitch(_ sender: UISwitch) {
        print("switch changed")
    }
    
    func checkEmptyFields() {

        //check the credit card field
        if let creditCardNumber = CardNumberTextField.text, !creditCardNumber.isEmpty, creditCardNumber.count == 16  {
            CardNumberTextField.placeholder = ""
            CardNumberTextField.layer.borderWidth = 0.0
            CardNumberTextField.layer.borderColor = UIColor.clear.cgColor
            
            cardNumber = creditCardNumber
        } else {
            CardNumberTextField.layer.borderColor = UIColor.red.cgColor
            CardNumberTextField.layer.borderWidth = 1.0
            CardNumberTextField.attributedPlaceholder = NSAttributedString(string: "Please Enter a Valid Credit Card Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            CardNumberTextField.text = ""
        }
        
        //check the expiration date
        if let expirationDate = DatePickerTextField.text, !expirationDate.isEmpty {
            DatePickerTextField.layer.borderWidth = 0.0
            DatePickerTextField.layer.borderColor = UIColor.clear.cgColor
        } else {
            DatePickerTextField.layer.borderColor = UIColor.red.cgColor
            DatePickerTextField.layer.borderWidth = 1.0
            DatePickerTextField.attributedPlaceholder = NSAttributedString(string: "MM/YYYY", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            DatePickerTextField.text = ""
        }
        // check the cvv
        if let CVV = CVVTextField.text, !CVV.isEmpty {
            CVVTextField.placeholder = ""
            CVVTextField.layer.borderWidth = 0.0
            CVVTextField.layer.borderColor = UIColor.clear.cgColor
        } else {
            CVVTextField.layer.borderColor = UIColor.red.cgColor
            CVVTextField.layer.borderWidth = 1.0
            CVVTextField.attributedPlaceholder = NSAttributedString(string: "Enter a valid CVV number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            CVVTextField.text = ""
        }
        // check the name
        if let firstandLastName = CardHolderNameTextField.text, !firstandLastName.isEmpty, firstandLastName.contains(" ") && firstandLastName.last != " " {
            CardHolderNameTextField.placeholder = ""
            CardHolderNameTextField.layer.borderWidth = 0.0
            CardHolderNameTextField.layer.borderColor = UIColor.clear.cgColor
            
            cardHolderName = firstandLastName
        } else {
            CardHolderNameTextField.layer.borderColor = UIColor.red.cgColor
            CardHolderNameTextField.layer.borderWidth = 1.0
            CardHolderNameTextField.attributedPlaceholder = NSAttributedString(string: "Enter a valid First and Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            CardHolderNameTextField.text = ""
        }
    }
    
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
       DatePickerTextField.inputAccessoryView = toolBar
    }
    
    @objc func action() {
        let month: Int = datePicker.month
        let year: Int = datePicker.year
        
        let expirationDate = String(format: "%02d/%d", month, year)
        DatePickerTextField.text = expirationDate
          view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textFieldText = textField.text, textFieldText != "" && textFieldText != " " else {
            return
        }
        
        if textField == CardNumberTextField && textFieldText.count > 4 {
            cardNumber = textFieldText
            
            var showSomeNumbers = ""
            let passwordArray = Array(cardNumber)
            for _ in 0..<(passwordArray.count-4) {
                showSomeNumbers.append("*")
            }
            for i in (passwordArray.count - 4)...(passwordArray.count - 1) {
                showSomeNumbers.append(passwordArray[i])
            }
            textField.text = showSomeNumbers
        }
    }
}
