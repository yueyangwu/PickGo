//
//  Item.swift
//  PickGo
//
//  Created by Lily on 3/20/18.
//  Copyright © 2018 Lily. All rights reserved.
//

import Foundation

class Item {
    //Properties
    var id: String
    var name: String
    var price: String
    var description: String
    
    //Methods
    ///init method, to set the default value
    init(id: String, name: String, price: String, description: String) {
        self.id = id
        self.name = name
        self.price = price
        self.description = description
    }
    
}
