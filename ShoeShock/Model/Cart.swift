//
//  Cart.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/17/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import Foundation

class Cart {
    
    var shoes = [Shoe]()
    
    public var totalCartValue: Double {
        get {
            var running = 0.0
            for x in 0..<shoes.count {
                let quantity = shoes[x].quantity
                running += (shoes[x].price * quantity)
            }
            return running
        }
    }
    
    func addItemToCart(item: Shoe) {
        shoes.append(item)
    }
    
    func updateShoe(shoe: Shoe) {
        if let idx = shoes.firstIndex(where: { $0.title == shoe.title }) {
            shoes[idx] = shoe
        }
    }
    
    func getMatchingShoe(shoe: Shoe?) -> Shoe? {
        guard let shoe = shoe else { return nil }
        if let idx = shoes.firstIndex(where: { $0.title == shoe.title }) {
            return shoes[idx]
        }
        return nil
    }

    func removeItemFromCart(shoe: Shoe) {
        if let idx = shoes.firstIndex(where: { $0.title == shoe.title }) {
            shoes.remove(at: idx)
        }
    }

    func emptyCart() {
        shoes.removeAll()
    }

}
