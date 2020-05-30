//
//  Category.swift
//  ListDash
//
//  Created by Jared Borders on 5/29/20.
//  Copyright © 2020 Jared Borders. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    
    let items = List<Item>()
    
}
