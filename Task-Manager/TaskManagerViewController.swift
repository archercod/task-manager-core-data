//
//  TaskManagerViewController.swift
//  Task-Manager
//
//  Created by Marcin Pietrzak on 01.10.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import UIKit
import CoreData

class TaskManagerViewController: UITableViewController {
    
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    lazy var fetchedResultsController: NSFetchedResultsController<Item> = {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try fetchedResultsController.performFetch()
        }
        catch {
            print("Error fetching Item objects: \(error.localizedDescription)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        return section.numberOfObjects
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        return configureCell(cell, at: indexPath)
    }
    
    private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        let item = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = item.text
        return cell
    }
    

    

}
