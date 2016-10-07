//
//  NearByController.swift
//  Swift-Base
//
//  Created by Peerapun Sangpun on 5/15/2559 BE.
//  Copyright © 2559 Flatstack. All rights reserved.
//

import UIKit
import RealmSwift

class PropertyCell: UITableViewCell {
   
 
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var labelDetail: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}



class ListController  :  UITableViewController,UISearchResultsUpdating , UISearchBarDelegate{
    var imageCache = [String:UIImage]()
    var data:Results<Fish>?
    var filtered:Results<Fish>?
    var searchActive : Bool = false
    
    var resultSearchController =  UISearchController()
  
    //@IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hideKeyboardWhenTappedAround()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
 
        self.title = "ข้อมูลสัตว์น้ำของไทย"
    
        //let tempImageView = UIImageView(image: UIImage(named: "background"))
        //tempImageView.frame = self.tableView.frame
        //self.tableView.backgroundView = tempImageView;
        //self.tableView.separatorColor = UIColor.clearColor()
        //UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchController.self]).textColor = UIColor.whiteColor()

        //tableView.estimatedRowHeight = 89
        //tableView.rowHeight = UITableViewAutomaticDimension
        //searchBar.delegate = self
        
        do {
            let realm = try Realm()
            
            
            data = realm.objects(Fish)
        } catch _ as NSError {
            // handle error
        }

        if #available(iOS 9.0, *) {
            self.resultSearchController.loadViewIfNeeded()// iOS 9
        } else {
            // Fallback on earlier versions
            let _ = self.resultSearchController.view          // iOS 8
        }
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.hidesNavigationBarDuringPresentation = true
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.delegate = self
            //controller.searchBar.tintColor = UIColor.whiteColor()
            //controller.searchBar.barTintColor = UIColor.whiteColor()
            controller.searchBar.searchBarStyle = .Prominent
            controller.searchBar.sizeToFit()
            controller.searchResultsUpdater = self
            self.tableView.tableHeaderView = controller.searchBar
            return controller
        })()
        
        self.tableView.reloadData()
        
    }
 
    // The output below is limited by 1 KB.
    // Please Sign Up (Free!) to remove this limitation.
    
    
       
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        if searchController.searchBar.text?.characters.count > 0 {
            
            let predicate = NSPredicate(format: "thaiName  CONTAINS [c]%@", searchController.searchBar.text!);
            do {
                filtered = try Realm().objects(Fish).filter(predicate).sorted("thaiName", ascending: true)
            } catch {
                
            }
            
        }
        else {
              filtered = data
        }
       self.tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
 
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active {
            return filtered!.count
        }
        return (data?.count)!;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("PropertyCell", forIndexPath: indexPath) as! PropertyCell
         let fish: Fish
        if(self.resultSearchController.active){
            fish = filtered![indexPath.row] as Fish
        } else {
            fish = data![indexPath.row] as Fish
        }
        
        //let contact: Contact = self.data![indexPath.row] as! Contact
        cell.labelText?.text =   fish.thaiName
        cell.labelDetail?.text = fish.scienceName
        cell.img?.image = UIImage(named: "nopic")
        let urlString :String = fish.imageSmallPath
       
        // If this image is already cached, don't re-download
        if let img = imageCache[urlString] {
            cell.img?.image = img
        }
        else {
            FetchAsync(url: urlString) { data in // code is at bottom, this just drys things up
                if(data != nil) {
                    let image = UIImage(data: data!)
                    if( image != nil) {
                        //print("ur:\(urlString)")
                        self.imageCache[urlString] = image
                        dispatch_async(dispatch_get_main_queue(), {
                            cell.img?.image = image
                        })
                    }
                }
            }
        }

        
        
        return cell
    }
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "goDetail" {
            let destination = segue.destinationViewController as? DetailController
            let fish: Fish?
            let  index = tableView.indexPathForSelectedRow?.row
            if(self.resultSearchController.active){
                fish = filtered![index!] as Fish
            } else {
                fish = data![index!] as Fish
            }
            destination?.fish = fish
        }
    }
    
}

