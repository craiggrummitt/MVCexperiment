//
//  SecondViewController.swift
//  MVCExperiment
//
//  Created by Craig on 16/10/2014.
//  Copyright (c) 2014 Craig. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var customView:Type2View?
    let items = ["Item 1","Item 2","Item 3","Item 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let customViewUnwrapped = customView {
            customViewUnwrapped.pickerView.reloadAllComponents()
        }
    }

    @IBAction func openView(sender: AnyObject) {
        var customView = NSBundle.mainBundle().loadNibNamed("Type2View", owner: self, options: nil)[0] as? Type2View
        if let customViewUnwrapped = customView {
            
            /*  ----------------------------------------------------------------------------------------------------------
            View Controller calls itself the dataSource and delegate of the UIPickerView in the custom view.
            Custom view knows nothing about the data.
            However the View Controller needs to know about the implementation of the picker in the custom view,
            violating OOP encapsulation?
            ---------------------------------------------------------------------------------------------------------       */
            customViewUnwrapped.pickerView.dataSource = self
            customViewUnwrapped.pickerView.delegate = self
            
            self.view.addSubview(customViewUnwrapped)
            customViewUnwrapped.center = self.view.center
        }
    }
    
    //MARK: UIPicker dataSource methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return(items.count)
    }
    //MARK: UIPicker delegate methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return(items[row])
    }


}

