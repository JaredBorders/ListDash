//
//  Item.swift
//  ListDash
//
//  Created by Jared Borders on 5/29/20.
//  Copyright © 2020 Jared Borders. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var dateCreated: Date?
    @objc dynamic var done: Bool = false
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
