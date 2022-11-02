//
//  CustomView.swift
//  MVC
//
//  Created by Sadaf Fatin on 10/17/20.
//  Copyright © 2020 SYNESISIT. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override func awakeFromNib() {
        
        layer.cornerRadius = 10
        layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.75
        layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        layer.borderWidth = 3
    }

}
