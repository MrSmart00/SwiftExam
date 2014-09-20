//
//  Synchronize.swift
//  SwiftExam
//
//  Created by 日野森寛也 on 9/21/14.
//  Copyright (c) 2014 日野森寛也. All rights reserved.
//

import Foundation

class Synchronize {
    
    class var sharedInstance : Synchronize {
        struct Static {
            static var once : dispatch_once_t = 0
            static var instance : Synchronize? = nil
        }
        dispatch_once(&Static.once) {
            Static.instance = Synchronize()
        }
        return Static.instance!
    }
    
    func asyncPrint(max:Int, completion: () -> Void) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            for i in 0...max {
                println(i);
            }
            completion();
        })
    }
    
    func asyncCreateList(completion: (list:[String]) -> Void) {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            var msgs:[String] = [];
            for i in 0...100 {
                msgs.append("++ " + String(i));
            }
            completion (list: msgs);
        })
    }
}
