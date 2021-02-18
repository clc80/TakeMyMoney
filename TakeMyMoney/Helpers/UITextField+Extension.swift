//
//  UITextField+Extension.swift
//  TakeMyMoney
//
//  Created by Claudia Maciel on 2/17/21.
//
import Foundation
import UIKit

// Usage: Switch UITextView's "Done Accessory" to ON
extension UITextField {
  
  @IBInspectable var doneAccessory: Bool {
    get{
      return self.doneAccessory
    }
    set (hasDone) {
      if hasDone{
        addDoneButtonInKeyboard()
      }
    }
  }
  
  func addDoneButtonInKeyboard() {
    let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
    doneToolbar.barStyle = .default
    
    let flexSpaceBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneBarButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
    
    let items = [flexSpaceBarButton, doneBarButton]
    doneToolbar.items = items
    doneToolbar.sizeToFit()
    
    self.inputAccessoryView = doneToolbar
  }
  
  @objc func doneButtonAction() {
    self.resignFirstResponder()
  }
}
