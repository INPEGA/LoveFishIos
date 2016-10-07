//
//  InfoController.swift
//  Swift-Base
//
//  Created by Peerapun Sangpun on 5/24/2559 BE.
//  Copyright © 2559 Flatstack. All rights reserved.
//
import UIKit
import SwiftyJSON

class InfoCell: UITableViewCell {
 
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

class MetaController: UITableViewController {
    
    var data = [DataInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //var button = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Bordered, target: self, action: "goBack")
        //self.navigationItem.leftBarButtonItem = button
       //tableView.rowHeight = UITableViewAutomaticDimension
       
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
        if let path = NSBundle.mainBundle().pathForResource("datainfo", ofType: "json") {
            
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions()) as NSData!
                let obj = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? [String: AnyObject]
                
                data = [
                    DataInfo(title: "รหัสชุดข้อมูล", subtitle: obj!["Id"] as! String),
                    DataInfo(title: "ชื่อข้อมูล", subtitle:  obj!["Name"]as! String),
                    DataInfo(title: "วันที่เพิ่มข้อมูล", subtitle: obj!["CreateDate"] as! String),
                    DataInfo(title: "ขอบเขตเชิงภูมิศาสตร์", subtitle: obj!["GeoCoverage"] as! String),
                    DataInfo(title: "หมวดหมู่", subtitle:  obj!["Category"] as! String),
                    
                    DataInfo(title: "ชื่อผู้ติดต่อ", subtitle: obj!["ContactName"] as! String),
                    DataInfo(title: "อีเมล์ผู้ติดต่อ", subtitle: obj!["ContactEmail"] as! String),
                    DataInfo(title: "สิทธิ์ในการเข้าถึงข้อมูล", subtitle: obj!["AccessLevel"] as! String),
                    DataInfo(title: "ความถี่ในการปรับปรุง", subtitle: obj!["Frequency"] as! String),
                    DataInfo(title: "วันที่ปรับปรุงข้อมูลล่าสุด", subtitle: obj!["UpdateDate"] as! String),                ]
                
            }
            catch let error as NSError {
                print("Error is: \(error)")
            }
            
         
            
            
        }
     
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
   
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! InfoCell
        cell.labelTitle?.text = data[indexPath.row].title
        cell.labelTitle?.textColor = Theme.NavigationBar.barTint
        cell.labelSubTitle?.text = data[indexPath.row].subtitle
        
        cell.labelSubTitle.lineBreakMode =  NSLineBreakMode.ByWordWrapping;
        cell.labelSubTitle.numberOfLines = 0
        
        return cell
    }
    
}