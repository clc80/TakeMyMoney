//
//  PaymentConfirmationViewController.swift
//  TakeMyMoney
//
//  Created by Claudia Maciel on 2/18/21.
//

import UIKit

class PaymentConfirmationViewController: UIViewController {

    @IBOutlet var paymentTypeImage: UIImageView!
    @IBOutlet var paymentTypeLabel: UILabel!
    @IBOutlet var paymentTypeDetailsLabel: UILabel!
    
    var creditCard: CreditCard?
    var paypal: PayPal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    @IBAction func PayNowButtonPressed(_ sender: Any) {
    }
    
    func setUpViews() {
        if let paypal = paypal {
            paymentTypeImage.image = UIImage(named: paypal.image)
            paymentTypeLabel.text = "PayPal"
            paymentTypeDetailsLabel.text = "\(paypal.username)"
        }
        if let creditCard = creditCard {
            paymentTypeImage.image = UIImage(named: creditCard.image)
            paymentTypeLabel.text = "\(creditCard.Cardholder)"
            paymentTypeDetailsLabel.text = "\(creditCard.CardNumber)"
        }
    }

}
