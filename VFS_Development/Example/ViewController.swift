/*
 * Copyright (C) 2016 Xu,Cheng Wei <www16852@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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

    private let rootPath = NSSearchPathForDirectoriesInDomains(
        .documentDirectory,
        .userDomainMask,
        true)[0]

    public var plistPathInDocument:String{
        get{
            return rootPath + "/TEST"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let factory = LocalFileFactory()
        print(plistPathInDocument)
//        print("data file")
//        let s1 = plistPathInDocument + "/a"
//        let url1 = URL(fileURLWithPath: s1)
//        let data1 = LocalData(url:url1)
//        print("url1 = ",url1.absoluteString)
//        print("url1 name = ",url1.lastPathComponent)
//        print("data1 = ",data1)
//
//
//        print("")
//        print("folder")
//        let s2 = plistPathInDocument + "/b"
//        let url2 = URL(fileURLWithPath: s2)
//        let data2 = LocalData(url:url2)
//        print("url2 = ",url2.absoluteString)
//        print("url2 name = ",url2.lastPathComponent)
//        print("data2 = ",data2)


        print("")
        print("nil")
        let s3 = plistPathInDocument + "/ERTYUI"
        let url3 = URL(fileURLWithPath: s3)
        do{
            let data3 = try factory.getFile(url: url3)
            print("data3 = ",data3)
            try data3.create()
        }catch let error as NSError{
            print(error.debugDescription)
        }
        print("url3 = ",url3.absoluteString)
        print("url3 name = ",(url3.lastPathComponent))

//        do{
//            let isHidden = try url3.resourceValues(forKeys: [.isHiddenKey]).isHidden!
//            print(isHidden)
//        }catch let error as NSError{
//            print("hidden error = ",error.debugDescription)
//        }
//        let boo:Bool!
//        do{
//            boo = try data3?.create()
//            print(boo)
//        }
//        catch let error as NSError{
//            print("hidden error = ",error.debugDescription)
//        }


        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

