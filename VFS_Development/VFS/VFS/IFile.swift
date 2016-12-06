//
//  IFile.swift
//  VFS
//
//  Created by waltoncob on 2016/12/5.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public protocol IFile {
    func getType() throws -> FileType
    func getUrl() throws -> URL
    func getName() throws -> String
    func move(file:IFile) throws -> Bool
    func delete() throws -> Bool
    func isExists() throws -> Bool
    func isHidden() throws -> Bool?
    func create() throws -> Bool
    func getModificationDate() throws -> Date?
}
