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
        guard let time2 = Int(nameTextField.text ?? ""), time2 != 0, time2 < 25, time2 > 0 else {
                resultAddName.text = "Введите время от 1 до 24"
                nameTextField.text = ""
                resultAddName.textColor = .red
                resultAddName.isHidden = false
                return }
           
            DataManage.shared.timeOfDayData.append(time2)
            resultAddName.text = "\(nameTextField.text ?? "") добавлен/а в список"
            nameTextField.text = ""
            resultAddName.textColor = .blue
            resultAddName.isHidden = false
    }
}

