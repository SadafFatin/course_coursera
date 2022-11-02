//
//  File.swift
//  coder-swag
//
//  Created by Sadaf Fatin on 2/17/21.
//  Copyright © 2021 BISMILLAH-IT. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    private var categories :[Category] = [
        Category.init(title: "Hats",image: "hats"),
        Category.init(title: "Shirts",image: "shirts"),
        Category.init(title: "Hoodies",image: "hoodies"),
        Category.init(title: "Digital Goods",image: "digital"),
        Category.init(title: "Image",image: "image")
    ]
    
    private var hats :[Product] = [
        Product.init(title: "Hats are cool fashion", imageName: "hat01", price: "$80"),
        Product.init(title: "Hats are cool fashion", imageName: "hat02", price: "$75"),
        Product.init(title: "Hats are cool fashion", imageName: "hat03", price: "$65"),
        Product.init(title: "Hats are cool fashion", imageName: "hat04", price: "$70"),
        Product.init(title: "Hats are cool fashion", imageName: "hat01", price: "$80"),
          
       ]
    
    private var hoodies :[Product] = [
     Product.init(title: "Hoodies were popular among youngs", imageName: "hoodie01", price: "$65"),
    Product.init(title: "Hoodies were popular among youngs", imageName: "hoodie02", price: "$45"),
    Product.init(title: "Hoodies were popular among youngs", imageName: "hoodie03", price: "$70"),
    Product.init(title: "Hoodies were popular among youngs", imageName: "hoodie04", price: "$80"),
    ]
    
    
    
    private var shirt :[Product] = [
     Product.init(title: "Shirts are not formal", imageName: "shirt01", price: "$80"),
     Product.init(title: "Shirts are  formal", imageName: "shirt02", price: "$80"),
     Product.init(title: "Shirts are not formal", imageName: "shirt03", price: "$80"),
     Product.init(title: "Shirts are not formal", imageName: "shirt04", price: "$80"),
                 
       
    ]
    
    private var digitalGoods :[Product] = [Product]()
    
    func getCategories()->[Category]{
        return self.categories
    }
    
    
    
    func getProducts(title:String)->[Product]{
        switch title {
        case "Shirts":
            return self.shirt
            case "Hoodies":
            return self.hoodies
            case "Digital Goods":
            return self.digitalGoods
            case "Hats":
            return self.hats
       
        default:
            return [Product]()
        }
    }







}
