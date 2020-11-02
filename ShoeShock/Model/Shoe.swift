//
//  Shoe.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/11/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

struct Shoe: Hashable {
    var title: String
    var description: String
    var image: String
    var price: Double
    var quantity: Double
    
    init(title: String, description: String, image: String, price: Double, quantity: Double) {
        self.title = title
        self.description = description
        self.image = image
        self.price = price
        self.quantity = quantity
    }
   
}
