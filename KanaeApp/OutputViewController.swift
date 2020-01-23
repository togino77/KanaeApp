//
//  OutputViewController.swift
//  KanaeApp
//
//  Created by OGINO Tetsuo on 2020/01/24.
//  Copyright © 2020 togino77.gmail.com. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    var outputText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.outputLabel.text = outputText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
