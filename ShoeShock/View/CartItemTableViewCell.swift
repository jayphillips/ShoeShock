//
//  CartItemTableViewCell.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/14/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

protocol CartItemTableViewCellDelegate: class {
    func didUpdateSubtotal(_ cell: CartItemTableViewCell)
}

class CartItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cartItemImage: UIImageView!
    @IBOutlet weak var cartItemTitle: UILabel!
    @IBOutlet weak var cartItemPrice: UILabel!
    @IBOutlet weak var cartItemQuantity: UILabel!
    @IBOutlet weak var cartItemQuantityStepper: UIStepper!
    
    weak var delegate: CartItemTableViewCellDelegate?
    
    var shoe: Shoe?
    
    func updateItemCell(item: Shoe) {
        self.shoe = item
        cartItemImage.image = UIImage(named: item.image)
        cartItemTitle.text = item.title
        let price = String(format: "%.2f", item.price)
        cartItemPrice.text = "$\(price)"
        cartItemQuantity.text = "\(Int(item.quantity))"
        
    }
    
    @IBAction func cartItemQuantityStepper(_ sender: UIStepper) {
        guard var shoe = Data.instance.getCart().getMatchingShoe(shoe: self.shoe) else { return }
        
        shoe.quantity = sender.value
        Data.instance.getCart().updateShoe(shoe: shoe)
        cartItemQuantity.text = "\(Int(shoe.quantity))"
        let cartPrice = String(format: "%.2f", shoe.quantity * shoe.price)
        cartItemPrice.text = "$\(cartPrice)"
        print(Data.instance.getCart().totalCartValue)
        delegate?.didUpdateSubtotal(self)
    }
}

