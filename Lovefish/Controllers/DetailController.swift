//
//  DetailController.swift
//  Researchcoatal
//
//  Created by Peerapun Sangpun on 7/10/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import UIKit
class DetailCell: UITableViewCell {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


class DetailController: UITableViewController {

    var fish: Fish!
    var data = [DataInfo]()
    var largeImage:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("obj\(research)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    
        do {
            data = [
                DataInfo(title: "ชนิดสัตว์น้ำ", subtitle:  (fish.type)),
                DataInfo(title: "ชื่อไทย", subtitle:  fish.thaiName),
                DataInfo(title: "ชื่อท้องถิ่น", subtitle:  fish.localName),
                DataInfo(title: "ชื่อสามัญ", subtitle:   fish.commonName),
                DataInfo(title: "ชื่อวิทยาศาสตร์", subtitle:  fish.scienceName),
                DataInfo(title: "ชื่อวงศ์สัตว์น้ำ", subtitle:  fish.familyName),
                DataInfo(title: "ชื่อ/ปีที่เผยแพร่", subtitle:  fish.publishName),
                DataInfo(title: "ลักษณะชีววิทยาทั่วไป", subtitle:  fish.bioInformation),
                DataInfo(title: "ถิ่นที่อาศัย", subtitle: fish.address),
                DataInfo(title: "สถานะภาพ", subtitle:  fish.status),
                DataInfo(title: "ที่มาของภาพ", subtitle:  fish.referenceImage),
                DataInfo(title: "ที่มาของข้อมูล", subtitle: fish.referenceData ),
 
            ]
            self.tableView.tableHeaderView =  self.downloadLargeImage(fish.imageSmallPath.stringByReplacingOccurrencesOfString("small",withString: "large"))
            initialSearchButton ()
        }
        catch let error as NSError {
            print("Error is: \(error)")
        }
         
        self.title = fish.thaiName
        tableView.estimatedRowHeight = 89
        tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func downloadLargeImage(imageLargePath:String) -> UIImageView {
        var largeImage: UIImageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.size.width, (self.view.frame.size.width * 5) / 8))
        largeImage.backgroundColor = UIColor(red: 237 / 255.0, green: 237 / 255.0, blue: 237 / 255.0, alpha: 1.0)
        largeImage.tag = 999
        if self.largeImage == nil {
            dispatch_async(dispatch_get_global_queue(Int(DISPATCH_QUEUE_PRIORITY_HIGH), 0)) {
                let data: NSData = NSData(contentsOfURL: NSURL(string: imageLargePath)!)!
                dispatch_async(dispatch_get_main_queue(), {() -> Void in
                    let transition: CATransition = CATransition()
                    transition.duration = 1.0
                    transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                    transition.type = kCATransitionFade
                    largeImage.layer.addAnimation(transition, forKey: nil)
                    largeImage.image = UIImage(data:data)
                    //self.largeImage.image = UIImage(data:data)
                })
            }
        }
        else {
            largeImage = self.largeImage
        }
        return largeImage
    }
    
    func initialSearchButton () {
        let viewBackGround: UIView = UIView(frame: CGRectMake(self.view.frame.size.width - 100, ((self.view.frame.size.width * 5) / 8) - 35, 70, 70))
        viewBackGround.backgroundColor = UIColor(red: 22 / 255.0, green: 70 / 255.0, blue: 116 / 255.0, alpha: 1.0)
        let searchBtn: UIImageView = UIImageView(frame: CGRectMake(5, 5, 60, 60))
        searchBtn.image = UIImage(named: "google")!
        searchBtn.contentMode = .ScaleAspectFit
        viewBackGround.addSubview(searchBtn)
        viewBackGround.layer.cornerRadius = 35.0
        viewBackGround.clipsToBounds = true
        self.tableView.addSubview(viewBackGround)
        let tapSearchBtn: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.openSearchController))
        viewBackGround.addGestureRecognizer(tapSearchBtn)
        
    }
    
    func openSearchController() {
 
        let searchView: WebController = self.storyboard!.instantiateViewControllerWithIdentifier("Web") as! WebController
        searchView.urlImage = self.fish.scienceName
        self.navigationController!.pushViewController(searchView, animated: true)
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DetailCell
        cell.labelText.text=data[indexPath.row].title
        cell.labelDetail?.text = data[indexPath.row].subtitle
        return cell
    }
    
 
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
  
}
