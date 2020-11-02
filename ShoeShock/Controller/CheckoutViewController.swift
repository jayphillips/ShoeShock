//
//  CheckoutViewController.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/26/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var billingAddressTextField: UITextField!
    @IBOutlet weak var shippingAddressTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    @IBOutlet weak var CSVTextField: UITextField!
    @IBOutlet weak var creditCardButton: CircularButton!
    @IBOutlet weak var billMeButton: CircularButton!
    @IBOutlet weak var completePurchaseButton: CircularButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTotal()
        hideCreditCardFields()
    }
    
    var totalPrice: Double!
        
    func showTotal() {
        let total = String(format: "%.2f", totalPrice)
        totalPriceLabel.text = "$\(total)"
    }
    
    func hideCreditCardFields() {
        cardNumberTextField.isHidden = true
        expirationDateTextField.isHidden = true
        CSVTextField.isHidden = true
    }
    
    func showPurchasedAlert() {
        let alert = UIAlertController(title: "Completed", message: "Your order has been submitted. Thank you!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: {_ in 
            self.navigationController?.popToRootViewController(animated: true)
        } ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func creditCardButtonPressed(_ sender: Any) {
        billMeButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        creditCardButton.layer.backgroundColor = #colorLiteral(red: 1, green: 0.3146138032, blue: 0.3124195674, alpha: 1)
        cardNumberTextField.isHidden = false
        expirationDateTextField.isHidden = false
        CSVTextField.isHidden = false
    }
    
    @IBAction func billMeButtonPressed(_ sender: Any) {
        creditCardButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        billMeButton.layer.backgroundColor = #colorLiteral(red: 1, green: 0.3146138032, blue: 0.3124195674, alpha: 1)
        hideCreditCardFields()
    }
    
    @IBAction func completePurchaseButtonPressed(_ sender: Any) {
        Data.instance.getCart().emptyCart()
        showPurchasedAlert()        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

