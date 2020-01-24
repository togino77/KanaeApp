//
//  ViewController.swift
//  KanaeApp
//
//  Created by OGINO Tetsuo on 2020/01/24.
//  Copyright © 2020 togino77.gmail.com. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var doHiraganaButton: RoundButton!
    var outputText = ""
    var connecting = false
    var activityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setEnableForDoHiraganaButton()
        inputTextField.delegate = self

        activityIndicatorView.center = view.center
        activityIndicatorView.style = .large
        activityIndicatorView.color = .gray
        view.addSubview(activityIndicatorView)
    }
    
    @IBAction func touchUpHiragana(_ sender: Any) {
        let manager = ApiManager.manager
        
        if connecting {
            return
        }
        self.beginConnection()
        manager.hiragana(sentence: self.inputTextField.text!, completionHandler: {(converted, error) in
            self.endConnection()
            if let error = error {
                return self.errorProc(error: error)
            }
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setEnableForDoHiraganaButton() {
        doHiraganaButton.isEnabled = (inputTextField.text?.count ?? 0) > 0
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        self.setEnableForDoHiraganaButton()
    }
    
    func beginConnection() {
        connecting = true
        activityIndicatorView.startAnimating()
    }
    
    func endConnection() {
        connecting = false
        activityIndicatorView.stopAnimating()
    }
    
    private func errorProc(error: Error) {
        //TODO: error の種類や内容によって対応を変える。とりあえずダイアログで表示しているだけ。
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true)
    }
}

