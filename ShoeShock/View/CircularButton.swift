//
//  CircularButton.swift
//  ShoeShock
//
//  Created by Jay Phillips on 6/12/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

class CircularButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        roundButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        roundButton()
    }
    
    func roundButton() {
        layer.cornerRadius = 15
    }
}
