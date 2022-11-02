//
//  Product.swift
//  coder-swag
//
//  Created by Sadaf Fatin on 2/22/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import Foundation

struct Product {
    
    
    private(set) public var title:String
    private(set) public var imageName:String
    private(set) public var price:String
    
    init(title:String , imageName:String, price:String) {
        self.title = title
        self.imageName = imageName
        self.price = price
    }
    
    
    
    
}
