//
//  FirstViewController.swift
//  MVCExperiment
//
//  Created by Craig on 16/10/2014.
//  Copyright (c) 2014 Craig. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let items = ["Item 1","Item 2","Item 3","Item 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openView(sender: AnyObject) {
        var customView = NSBundle.mainBundle().loadNibNamed("BasicView", owner: self, options: nil)[0] as? BasicView
        if let customViewUnwrapped = customView {
            
        /*  ----------------------------------------------------------------------------------------------------------
            //pass in data directly to the custom view, custom view handles displaying the data in the UIPicker
            ---------------------------------------------------------------------------------------------------------       */
            customViewUnwrapped.addItems(items)
            
            self.view.addSubview(customViewUnwrapped)
            customViewUnwrapped.center = self.view.center
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

