//
//  ViewController.swift
//  KanaeApp
//
//  Created by OGINO Tetsuo on 2020/01/24.
//  Copyright © 2020 togino77.gmail.com. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var doHiraganaButton: RoundButton!
    var outputText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setEnableForDoHiraganaButton()

    }
    
    @IBAction func touchUpHiragana(_ sender: Any) {
        let manager = ApiManager.manager
        manager.hiragana(sentence: self.inputTextField.text!, completionHandler: {(converted, error) in
            if let converted = converted {
                self.outputText = converted
                self.performSegue(withIdentifier: "goOutput", sender: nil)
            }
        })

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goOutput":
            if let controller = segue.destination as? OutputViewController {
                controller.outputText = outputText
            }
            break
        default:
            break
        }
    }
    
    func setEnableForDoHiraganaButton() {
        doHiraganaButton.isEnabled = (inputTextField.text?.count ?? 0) > 0
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        self.setEnableForDoHiraganaButton()
    }
    
}

