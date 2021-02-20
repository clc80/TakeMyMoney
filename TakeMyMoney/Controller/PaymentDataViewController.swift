//
//  ViewController.swift
//  TakeMyMoney
//
//  Created by Claudia Maciel on 2/9/21.
//

import UIKit

class PaymentDataViewController: UIViewController {
    
    //MARK: - IBOUtlet
    @IBOutlet var viewContainer: UIView!
    @IBOutlet var PaymentSegmentedControl: UISegmentedControl!
    
    var views: [UIView]!
    
    let creditCardVC =  CreditCardViewController(nibName: "CreditCardViewController", bundle: nil)
    let paypalVC = PayPalViewController(nibName: "PayPalViewController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views = [UIView]()
        views.append(paypalVC.view)
        views.append(creditCardVC.view)
        
        for v in views {
            viewContainer.addSubview(v)
        }
        viewContainer.bringSubviewToFront(views[0])
        
    }
    
    // MARK: - IBAction
    @IBAction func PaymentTypeSegmentedControlChanged(_ sender: UISegmentedControl) {
        self.viewContainer.bringSubviewToFront(views[sender.selectedSegmentIndex])
    }
    
    @IBAction func ProceedButtonPressed(_ sender: UIButton) {
        let viewShown = self.PaymentSegmentedControl.selectedSegmentIndex
        
        // if the credit card view is shown
        if viewShown == 1 {
            creditCardVC.checkEmptyFields()
            let paymentConfirmVC: PaymentConfirmationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ConfirmPaymentVC") as! PaymentConfirmationViewController
            paymentConfirmVC.creditCard = creditCardVC.creditCard
            navigationController?.pushViewController(paymentConfirmVC, animated: true)
        } else if viewShown == 0 {
            paypalVC.checkEmptyFields()
            let paymentConfirmVC: PaymentConfirmationViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ConfirmPaymentVC") as! PaymentConfirmationViewController
            paymentConfirmVC.paypal = paypalVC.payPal
            navigationController?.pushViewController(paymentConfirmVC, animated: true)
        }
    }
}

