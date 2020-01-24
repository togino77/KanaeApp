//
//  RoundButton.swift
//  KanaeApp
//
//  Created by OGINO Tetsuo on 2020/01/24.
//  Copyright © 2020 togino77.gmail.com. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = (self.isEnabled || borderColor == UIColor.clear) ? borderColor.cgColor : UIColor.gray.cgColor
        clipsToBounds = (cornerRadius > 0)
        
        super.draw(rect)
    }
}
