//
//  AppleProduct.swift
//  MVC
//
//  Created by Sadaf Fatin on 10/17/20.
//  Copyright © 2020 SYNESISIT. All rights reserved.
//

import Foundation

class AppleProduct {
    
    public private(set) var name:String
    public private(set) var price:Double
    public private(set) var color:String
    
    init(name:String, price:Double, color: String) {
        self.color = color
        self.price = price
        self.name = name
        
    }
}
