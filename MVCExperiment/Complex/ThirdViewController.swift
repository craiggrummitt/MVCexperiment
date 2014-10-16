//
//  SecondViewController.swift
//  MVCExperiment
//
//  Created by Craig on 16/10/2014.
//  Copyright (c) 2014 Craig. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, Type3DataSource, Type3Delegate {
    var customView:Type2View?
    let items = ["Item 1","Item 2","Item 3","Item 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let customViewUnwrapped = customView {
            customViewUnwrapped.pickerView.reloadAllComponents()
        }
    }

    @IBAction func openView(sender: AnyObject) {
        var customView = NSBundle.mainBundle().loadNibNamed("Type3View", owner: self, options: nil)[0] as? Type3View
        if let customViewUnwrapped = customView {
            /*  ----------------------------------------------------------------------------------------------------------
            View Controller calls itself the dataSource and delegate of the custom view.
            Custom view calls itself the dataSource and delegate of the UIPicker.
            The ViewController knows nothing about the implementation of the picker in the custom view. (Tick for good OOP encapsulation)
            The custom view knows nothing about the data. (Tick for good MVC)
            But - is this OTT - over the top?
            ---------------------------------------------------------------------------------------------------------       */
            customViewUnwrapped.dataSource = self
            customViewUnwrapped.delegate = self
            
            self.view.addSubview(customViewUnwrapped)
            customViewUnwrapped.center = self.view.center
        }
    }
    
    //MARK: Type3 dataSource methods
    func numberOfItems() -> Int {
        return(items.count)
    }
    //MARK: Type3 delegate methods
    func titleForItem(titleForRow row: Int) -> String! {
        return(items[row])
    }

}

