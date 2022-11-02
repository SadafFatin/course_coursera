//
//  BorderButton.swift
//  app-swoosh
//
//  Created by Sadaf Fatin on 11/1/20.
//  Copyright © 2020 BISMILLAH-IT. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 3.0
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
    }

}
