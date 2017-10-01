//
//  Item+CoreDataProperties.swift
//  Task-Manager
//
//  Created by Marcin Pietrzak on 01.10.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var text: String
    @NSManaged public var isCompeted: Bool

}
