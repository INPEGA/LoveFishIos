//
//  ViewController.swift
//  Msociety
//
//  Created by Peerapun Sangpun on 7/5/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//

import UIKit

class LicenseController: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
 
  
 
        do {
            let localfilePath = NSBundle.mainBundle().URLForResource("license", withExtension: "html");
            let myRequest = NSURLRequest(URL: localfilePath!);
            webView.loadRequest(myRequest);
        }
        catch _ as NSError {
            // handle error
        }
         
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
