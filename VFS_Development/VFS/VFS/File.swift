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
//  File.swift
//  VFS
//
//  Created by waltoncob on 2016/12/2.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class File{

    private let url:URL
    private let data:Data?
    private var fileAttributes:[FileAttributeKey : Any] = [:]
    private let fileManager = FileManager.default

    public init(url:URL) throws {
        self.data = fileManager.contents(atPath: url.path)
        self.url = url
        if fileManager.fileExists(atPath: url.path){
            fileAttributes = try fileManager.attributesOfItem(atPath: url.path)
        }
    }

    public func getFileData() -> Data? {
        return data
    }

    public func getModificationDate() -> Date? {
        return fileAttributes[.modificationDate] as! Date?
    }

    public func getSize() -> Int{
        return fileAttributes[.size] as! Int
    }

    public func isExists() -> Bool{
        return fileManager.fileExists(atPath: url.absoluteString)
    }

    public func isHidden() throws -> Bool?{
        let isHidden = try url.resourceValues(forKeys: [.isHiddenKey]).isHidden
        return isHidden
    }

    public func getName() -> String{
        return url.lastPathComponent
    }

    public func create() -> Bool{
        var attributes:[String:Any] = [:]
        for (key,value) in fileAttributes{
            attributes[key.rawValue] = value
        }
        return fileManager.createFile(atPath:url.path, contents:data, attributes:attributes)
    }

}
