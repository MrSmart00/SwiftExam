//
//  ViewController.swift
//  SwiftExam
//
//  Created by 日野森寛也 on 9/20/14.
//  Copyright (c) 2014 日野森寛也. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table:UITableView!;
    private var strings:[String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Synchronize.sharedInstance.asyncPrint(5, completion: { () -> Void in
            println("FINISH!!");
        })
        
        Synchronize.sharedInstance.asyncCreateList { (list) -> Void in
            self.strings = list;
            self.table.reloadData();
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        println("viewDidAppear!");
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.strings[indexPath.row]
        return cell
    }
}

