//
//  AddNameViewController.swift
//  Scedule 2
//
//  Created by mac on 15.04.2022.
//

import UIKit

class AddNameViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var buttonSave: UIButton!
    @IBOutlet var resultAddName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultAddName.isHidden = true
        buttonSave.layer.cornerRadius = buttonSave.layer.frame.height/5
    }
    
    @IBAction func tapButtonSave(_ sender: Any) {
        if nameTextField.text != nil && nameTextField.text != "" {
            DataManage.shared.namesData.append(nameTextField.text ?? "0")
            resultAddName.text = "\(nameTextField.text ?? "") добавлен/а в список"
            nameTextField.text = ""
            resultAddName.textColor = .blue
            resultAddName.isHidden = false
        }  else {
            resultAddName.text = "Введите данные"
            resultAddName.textColor = .red
            resultAddName.isHidden = false
        }
    }
}
