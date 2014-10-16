//
//  BasicView.swift
//  MVCExperiment
//
//  Created by Craig on 16/10/2014.
//  Copyright (c) 2014 Craig. All rights reserved.
//

import UIKit

class BasicView: UIView, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    var items:[String]?
    
    func addItems(items:[String]) {
        self.items = items
        pickerView.reloadAllComponents()
    }
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
        if let itemsUnwrapped = items {
            return(itemsUnwrapped.count)
        }
        return 0
    }
    //MARK: UIPicker delegate methods    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return(items![row])
    }
}
