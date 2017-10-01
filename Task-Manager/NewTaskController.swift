//
//  NewTaskController.swift
//  Task-Manager
//
//  Created by Marcin Pietrzak on 01.10.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit
import CoreData

class NewTaskController: UIViewController {
    
    let managedObjectContext = CoreDataStack().managedObjectContext
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        item.text = text
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
