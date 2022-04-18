//
//  NameTableViewController.swift
//  Scedule 2
//
//  Created by mac on 10.04.2022.
//

import UIKit

class NameTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems?[1] = editButtonItem
        
    }

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManage.shared.namesData.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "segueName", for: indexPath)
//
        if indexPath.row < DataManage.shared.namesData.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "segueName", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = DataManage.shared.namesData[indexPath.row]
            cell.contentConfiguration = content
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "segueName", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = "Добавить новое имя"
            cell.contentConfiguration = content
            
            let colorForCell1 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
            let colorForCell2 = UIColor(red: 151/255, green: 172/255, blue: 201/255, alpha: 0.5).cgColor
            let colorForCell3 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).cgColor
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = cell.bounds
            gradientLayer.colors = [colorForCell1, colorForCell2, colorForCell3]
            cell.layer.insertSublayer(gradientLayer, at: 1)
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataManage.shared.namesData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == DataManage.shared.namesData.count {
            performSegue(withIdentifier: "segueToAddName", sender: nil)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}

