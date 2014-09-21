//
//  Network.swift
//  SwiftExam
//
//  Created by 日野森寛也 on 9/21/14.
//  Copyright (c) 2014 日野森寛也. All rights reserved.
//

import Foundation

class Network {
    
    init() {
        println("INITIALIZE!!");
    }
    
    func connect (url: String, completion: (list: AnyObject) -> Void){
        let URL: NSURL = NSURL(string: url)
        let request: NSURLRequest = NSURLRequest(URL: URL)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            let json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSArray
            completion(list: json);
        })
    }

}