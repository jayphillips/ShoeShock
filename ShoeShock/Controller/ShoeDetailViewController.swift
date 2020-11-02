//
//  ShoeDetailViewController.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/11/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

class ShoeDetailViewController: UIViewController {
    
    
    @IBOutlet weak var selectedShoeImage: UIImageView!
    @IBOutlet weak var selectedShoePrice: UILabel!
    @IBOutlet weak var selectedShoeLabel: UILabel!
    
    var selectedShoe: Shoe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedShoeImage.image = UIImage(named: selectedShoe.image)
        let shoePrice = String(format: "%.2f", selectedShoe.price)
        selectedShoePrice.text = "$\(shoePrice)"
        selectedShoeLabel.text = selectedShoe.description
        
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        Data.instance.getCart().addItemToCart(item: selectedShoe)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
