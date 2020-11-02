//
//  Data.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/12/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import Foundation

class Data {
    
    static let instance = Data()
    
    private var shoes = [
        Shoe(title: "Nike Air Max 2090", description: "Nike Air Max 2090", image: "nike1.png", price: 150.00, quantity: 1),
        Shoe(title: "adidas Hardcourt Low", description: "adidas Hardcourt Low", image: "adidas1.png", price: 75.00, quantity: 1),
        Shoe(title: "Nike Air Force 1", description: "Nike Air Force 1", image: "nike2.png", price: 90.00, quantity: 1),
        Shoe(title: "Nike Air Max React 270", description: "Nike Air Max React 270", image: "nike3.png", price: 170.00, quantity: 1),
        Shoe(title: "Jordan Trunner Advance", description: "Nike Air Jordan Trunner Advance", image: "jordan1.png", price: 110.00, quantity: 1),
        Shoe(title: "Nike Air Zoom Pegasus", description: "Nike Air Zoom Pegasus", image: "nike4.png", price: 130.00, quantity: 1),
        Shoe(title: "Fila Venom", description: "Fila Venom", image: "fila1.png", price: 90.00, quantity: 1),
        Shoe(title: "adidas SF Ultraboost", description: "adidas SF Ultraboost", image: "adidas2.png", price: 150.00, quantity: 1),
        Shoe(title: "Nike Air Metal Max", description: "Nike Air Metal Max", image: "nike5.png", price: 140.00, quantity: 1),
        Shoe(title: "adidas Original Superstar", description: "adidas Original Superstar", image: "adidas3.png", price: 70.00, quantity: 1)
    ]
    
    var cart = Cart()
    
    func getShoes() -> [Shoe] {
        return shoes
    }

    func getCart() -> Cart {
        return cart
    }
    
}
