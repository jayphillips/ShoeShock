//
//  MainViewController.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/11/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var shoeCollectionView: UICollectionView!
    
    var selectedShoe: Shoe?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoeCollectionView.delegate = self
        shoeCollectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.instance.getShoes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as? MainCollectionViewCell {
            let shoe = Data.instance.getShoes()[indexPath.row]
            
            cell.favoritePressed = {
                Data.instance.getCart().addItemToCart(item: shoe)
                cell.favoriteIcon.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                
                }

            cell.updateView(shoe: shoe)
                        
            return cell
        }
        return MainCollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.size.height
        let width = view.frame.size.width
       
        return CGSize(width: width * 1.0, height: height * 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedShoe = Data.instance.getShoes()[indexPath.row]
        performSegue(withIdentifier: "toShoeDetailViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let shoeDetailViewController = segue.destination as? ShoeDetailViewController {
            shoeDetailViewController.selectedShoe = selectedShoe
        }
    }    
}




