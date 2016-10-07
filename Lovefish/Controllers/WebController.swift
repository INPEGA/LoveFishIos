//
//  PdfController.swift
//  Researchcoatal
//
//  Created by Peerapun Sangpun on 7/14/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//


import UIKit

class WebController: UIViewController {
    
    
    
    @IBOutlet weak var webView: UIWebView!
    var urlImage:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.topItem?.title = ""
        let imageName: String = self.urlImage.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        let url: String = "https://www.google.co.th/search?q=\(imageName)&biw=1920&bih=911&source=lnms&tbm=isch&sa=X&ved=0CAcQ_AUoAWoVChMI3uvO5ouDyAIVQZCOCh3jaABp"
        self.webView.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
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
