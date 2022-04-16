//
//  ResultTableViewController.swift
//  Scedule 2
//
//  Created by mac on 10.04.2022.
//

import UIKit

class ResultTableViewController: UITableViewController {
    
    var numberOfRow = 0
    var schedule: [Schedule] = []
    var delegate: ResultViewControllerDelegate!
    
    @IBAction func buttonSave(_ sender: Any) {
        delegate.saveValue(numberOfRow, schedule, .green)
        print("numberOfRow = \(numberOfRow)")
        dismiss(animated: true)
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRow
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rowsScedule", for: indexPath)
        var content =  cell.defaultContentConfiguration()
        content.text = """
     \(schedule[indexPath.row].timeOfDay) \(schedule[indexPath.row].toDo) с \(schedule[indexPath.row].name)
"""
        cell.contentConfiguration = content
        return cell
    }
}
