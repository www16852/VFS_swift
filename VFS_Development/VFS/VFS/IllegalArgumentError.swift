//
//  IllegalArgumentError.swift
//  VFS
//
//  Created by waltoncob on 2016/12/6.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class IllegalArgumentError:Error {
    public let info:String
    public init(info:String){
        self.info = info
    }
}
