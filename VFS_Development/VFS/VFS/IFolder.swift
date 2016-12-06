//
//  IFolder.swift
//  VFS
//
//  Created by waltoncob on 2016/12/5.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public protocol IFolder:IFile{
    func getchildren() throws -> [IFile]
}
