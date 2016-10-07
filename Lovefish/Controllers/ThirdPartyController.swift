//
//  ThirdPartyController.swift
//  Msociety
//
//  Created by Peerapun Sangpun on 7/5/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import UIKit


class ThirdPartyController: UITableViewController {
    
    var data = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //var button = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Bordered, target: self, action: "goBack")
        //self.navigationItem.leftBarButtonItem = button
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
            do {
                if let path = NSBundle.mainBundle().pathForResource("third_party", ofType: ""){
                    let entry = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
                    
                    self.data = entry.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet())
                    //print(myStrings)
                }
            } catch let err as NSError {
                //do sth with Error
                print(err)
            }
            
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text=data[indexPath.row] as? String
        
        return cell
    }
    
}