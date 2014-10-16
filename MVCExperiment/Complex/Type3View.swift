//
//  BasicView.swift
//  MVCExperiment
//
//  Created by Craig on 16/10/2014.
//  Copyright (c) 2014 Craig. All rights reserved.
//

import UIKit
//MARK: Custom DataSource
protocol Type3DataSource : NSObjectProtocol {
    func numberOfItems() -> Int
}
//MARK: Custom Delegate
protocol Type3Delegate : NSObjectProtocol {
    func titleForItem(titleForRow row: Int) -> String!
}

class Type3View: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    var dataSource: Type3DataSource? // default is nil. weak reference
    var delegate: Type3Delegate? // default is nil. weak reference
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func didMoveToSuperview() {
        pickerView!.dataSource = self
        pickerView!.delegate = self
    }
    @IBAction func closeButton(sender: AnyObject) {
        self.removeFromSuperview()
    }
    //MARK: UIPicker dataSource methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if let dataSourceUnwrapped = dataSource {
            return(dataSourceUnwrapped.numberOfItems())
        }
        return 0
    }
    //MARK: UIPicker delegate methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if let delegateUnwrapped = delegate {
            return(delegateUnwrapped.titleForItem(titleForRow: row))
        }
        return ""
    }
}
