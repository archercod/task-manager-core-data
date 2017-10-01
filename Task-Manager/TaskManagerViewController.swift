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
    
    lazy var fetchedResultsController: TaskManagerFetchedResultsController = {
        return TaskManagerFetchedResultsController(managedObjectContext: self.managedObjectContext, tableView: self.tableView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navigationController = segue.destination as! UINavigationController
            let NewTaskController = navigationController.topViewController as! NewTaskController
            
            NewTaskController.managedObjectContext = self.managedObjectContext
        }
    }

}

