//
//  SearchController.swift
//  Msociety
//
//  Created by Peerapun Sangpun on 7/4/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import UIKit



class SettingController: UITableViewController {
     
    var settings = ["Meta Data","Open Government License - Thailand (OGL)","Third-Party Library"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //var button = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Bordered, target: self, action: "goBack")
        //self.navigationItem.leftBarButtonItem = button
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
 
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        //let candy:Candy = settings[indexPath.row]
        cell.textLabel!.text = settings[indexPath.row]
        //cell.detailTextLabel!.text = candy.category

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
       
        if indexPath.row == 0
        {
            self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("meta") as UIViewController, animated: true)
        }
        else if indexPath.row == 1
        {
             self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("license") as UIViewController, animated: true)
        }
        else if indexPath.row == 2
        {
           self.navigationController!.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("third_party") as UIViewController, animated: true)
        }
        
    }
    
    
}
    