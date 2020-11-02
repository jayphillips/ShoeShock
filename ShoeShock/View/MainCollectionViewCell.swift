//
//  MainCollectionViewCell.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/12/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shoeImage: UIImageView!    
    @IBOutlet weak var shoeTitleLabel: UILabel!
    @IBOutlet weak var favoriteIcon: UIButton!
    
    var favoritePressed: (() -> ())?
    
    func updateView(shoe: Shoe) {
        shoeImage.image = UIImage(named: shoe.image)
        let shoePrice = String(format: "%.2f", shoe.price)
        shoeTitleLabel.text = "\(shoe.title)    $\(shoePrice)"
        favoriteIcon.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    @IBAction func favoriteIconPressed(_ sender: UIButton) {
        favoritePressed?()
    }
}
