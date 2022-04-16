//
//  AddTimeViewController.swift
//  Scedule 2
//
//  Created by mac on 15.04.2022.
//

import UIKit

class AddTimeViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var buttonSave: UIButton!
    @IBOutlet var resultAddName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultAddName.isHidden = true
        buttonSave.layer.cornerRadius = buttonSave.layer.frame.height/5
    }
    
    @IBAction func tapButtonSave(_ sender: Any) {
        if nameTextField.text != nil {
            guard let time = nameTextField.text else { return }
            let intTime = Int(time) ?? 0
            DataManage.shared.timeOfDayData.append(intTime)
            resultAddName.text = "\(nameTextField.text ?? "") добавлен/а в список"
            nameTextField.text = ""
            resultAddName.isHidden = false
        }
    }
    
}

