//
//  Menu.swift
//  RMS
//
//  Created by Rashdan Natiq on 28/09/2017.
//  Copyright © 2017 Devclan. All rights reserved.
//

import UIKit

class Menu: NSObject {
    var itemId: Int!
    var itemName: String!
    var itemImage: String!
    init(itemId: Int, itemName: String, itemImage: String) {
        self.itemId = itemId
        self.itemName = itemName
        self.itemImage = itemImage
    }
}
