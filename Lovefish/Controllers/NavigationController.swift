//
//  NavigationController.swift
//  Swift-Base
//
//  Created by Peerapun Sangpun on 5/8/2559 BE.
//  Copyright © 2559 Flatstack. All rights reserved.
//
import UIKit
class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Status bar white font
        let font = UIFont(name: "THSarabunNew-Bold", size: 15.0)
        self.navigationBar.barTintColor = Theme.NavigationBar.tint
        self.navigationBar.tintColor = UIColor.whiteColor()
    
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: font!]
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(  [NSFontAttributeName : font!], forState: UIControlState.Normal)
        //UIApplication.sharedApplication().statusBarStyle = Theme.NavigationBar.statusBar
    }
}