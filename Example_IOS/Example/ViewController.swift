//
//  ViewController.swift
//  Example
//
//  Created by waltoncob on 2016/11/16.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import UIKit
import VFS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LocalData().hello()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

