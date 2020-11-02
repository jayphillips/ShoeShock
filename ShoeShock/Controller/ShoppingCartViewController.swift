//
//  ShoppingCartViewController.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/11/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CartItemTableViewCellDelegate {
    
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var checkOutButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        itemTableView.reloadData()
    }
    
    @IBAction func checkoutButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toCheckOutViewController", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cart = Data.instance.getCart()
        return cart.shoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as? CartItemTableViewCell {
            let shoes = Data.instance.getCart().shoes
            let shoe = shoes[indexPath.row]
            cell.delegate = self
            cell.cartItemQuantityStepper.tag = indexPath.row
            cell.cartItemQuantityStepper.value = shoe.quantity
            cell.updateItemCell(item: shoe)
            updateTotal()
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func didUpdateSubtotal(_ cell: CartItemTableViewCell) {
        guard let indexPath = itemTableView.indexPath(for: cell) else { return }
        let shoes = Data.instance.getCart().shoes
        
        if shoes[indexPath.row].quantity == 0.0 {
            Data.instance.getCart().removeItemFromCart(shoe: shoes[indexPath.row])
            itemTableView.deleteRows(at: [indexPath], with: .automatic)
            itemTableView.reloadData()
        }
        
        updateTotal()
    }

    func updateTotal() {
        let shoePrice = String(format: "%.2f", Data.instance.getCart().totalCartValue)
        totalLabel.text = "$\(shoePrice)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let checkOutVC = segue.destination as? CheckoutViewController {
            checkOutVC.totalPrice = Data.instance.getCart().totalCartValue
        }
    }
    
    @IBAction func checkOutButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "toCheckOutViewController", sender: self)
    }
        
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

