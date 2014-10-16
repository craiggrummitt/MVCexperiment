//
//  BasicView.swift
//  MVCExperiment
//
//  Created by Craig on 16/10/2014.
//  Copyright (c) 2014 Craig. All rights reserved.
//

import UIKit

class Type2View: UIView {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func closeButton(sender: AnyObject) {
        self.removeFromSuperview()
    }
    
}
