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
    var outputText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}

