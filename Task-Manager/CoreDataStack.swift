//
//  CoreDataStack.swift
//  Task-Manager
//
//  Created by Marcin Pietrzak on 29.09.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import Foundation

class CoreDataStack {
    
    // Create place to store data
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let endIndex = urls.index(before: urls.endIndex)
        return urls[endIndex]
    }()
}
