//
//  FetchAsync.swift
//  Lovefish
//
//  Created by Peerapun Sangpun on 7/14/2559 BE.
//  Copyright © 2559 Peerapun Sangpun. All rights reserved.
//
import Foundation
class FetchAsync {
    var url: String
    var callback: (NSData?) -> ()
    
    init(url: String, callback: (NSData?) -> ()) {
        self.url = url
        self.callback = callback
        self.fetch()
    }
    
    func fetch() {
        let imageRequest: NSURLRequest = NSURLRequest(URL: NSURL(string: self.url)!)
        NSURLConnection.sendAsynchronousRequest(imageRequest,
                                                queue: NSOperationQueue.mainQueue(),
                                                completionHandler: { response, data, error in
                                                    if(error == nil) {
                                                        self.callback(data)
                                                    } else {
                                                        self.callback(nil)
                                                    }
        })
        callback(nil)
    }
}