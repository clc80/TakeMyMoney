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
    let creditcardvc =  CreditCardViewController(nibName: "CreditCardViewController", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views = [UIView]()
        views.append(PayPalViewController().view)
        views.append(creditcardvc.view)
        
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
        print(viewShown)
    }
    

}

