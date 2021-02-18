//
//  CreditCardViewController.swift
//  TakeMyMoney
//
//  Created by Claudia Maciel on 2/11/21.
//

import UIKit

class CreditCardViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var CardNumberTextField: UITextField!
    @IBOutlet var CVVTextField: UITextField!
    @IBOutlet var CardHolderNameTextField: UITextField!
    @IBOutlet var DatePickerTextField: UITextField!
    
    let datePicker = MonthYearPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DatePickerTextField.inputView = datePicker
        dismissPickerView()
    }

    // MARK: - IBAction
    @IBAction func SaveCardForFutureSwitch(_ sender: UISwitch) {
        print("switch changed")
    }
    
    func checkEmptyFields() {
        print("Checking for empty fields in CreditCard View")
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
