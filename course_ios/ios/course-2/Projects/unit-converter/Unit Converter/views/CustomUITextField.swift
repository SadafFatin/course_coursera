//
//  CustomUILabel.swift
//  Unit Converter
//
//  Created by Sadaf Fatin on 12/23/20.
//  Copyright © 2020 BISMILLAH-IT. All rights reserved.
//

import UIKit


@IBDesignable
class CustomUITextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    func customizeView(){
        
        backgroundColor = #colorLiteral(red: 0.5012030602, green: 0.5012910962, blue: 0.5011914968, alpha: 0.504043794)
        layer.cornerRadius = 6.0
        textAlignment = .center
        clipsToBounds = true
        let p = "Enter your value"
        let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
        attributedPlaceholder = place
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    
    
    
    

}
