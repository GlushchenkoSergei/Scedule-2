//
//  SaveTableViewController.swift
//  Scedule 2
//
//  Created by mac on 15.04.2022.
//

import UIKit

class SaveTableViewController: UITableViewController {

    var numberOfRows = 0
    var schedule: [Schedule] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        numberOfRows
        schedule.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "saveCell", for: indexPath)
        var content =  cell.defaultContentConfiguration()
        content.text = """
    \(schedule[indexPath.row].timeOfDay) \(schedule[indexPath.row].toDo) с \(schedule[indexPath.row].name)
"""
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentCell = schedule.remove(at: sourceIndexPath.row)
        schedule.insert(currentCell, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            schedule.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}
