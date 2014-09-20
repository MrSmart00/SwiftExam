//
//  ViewController.swift
//  SwiftExam
//
//  Created by 日野森寛也 on 9/20/14.
//  Copyright (c) 2014 日野森寛也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Synchronize.sharedInstance.asyncPrint(5, completion: { () -> Void in
            println("FINISH!!");
        })
        
        Synchronize.sharedInstance.asyncCreateList { (list) -> Void in
            println("*** \(list)");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        println("viewDidAppear!");
    }
}

