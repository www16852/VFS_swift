//
//  ViewController.swift
//  Example
//
//  Created by waltoncob on 2016/11/28.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Cocoa
import VFS

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LocalData().hello()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

