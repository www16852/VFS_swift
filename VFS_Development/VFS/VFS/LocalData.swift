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
//  LocalData.swift
//  VFS
//
//  Created by waltoncob on 2016/11/25.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class LocalData:IFile{
    
    private var mUrl:URL
    private var mFile:File
    private var mFactory:LocalFileFactory
    private let fileManager = FileManager.default

    public init(factory:LocalFileFactory, url:URL) throws{
        self.mFactory = factory;
        self.mUrl = url
        self.mFile = try File(url:url)
    }

    public  func getType() -> FileType{
        return FileType.DATA;
    }

    public func move(file:IFile) throws -> Bool{
        guard let data = file as? LocalData else{
            throw IllegalArgumentError(info:"need to input LocalData")
        }
        if fileManager.fileExists(atPath: data.getUrl().path){
            self.mUrl = data.getUrl()
            self.mFile = data.getFile()
            return true
        }else{
            return false
        }
    }

    public func delete() -> Bool{
        if (try? fileManager.removeItem(at: mUrl)) != nil{
            return true
        }else{
            return false
        }
    }

    public func getUrl() -> URL{
        return self.mUrl
    }

    public func getName() -> String{
        return mFile.getName()
    }

    public func isExists() -> Bool{
        return mFile.isExists()
    }

    public func isHidden() throws -> Bool?{
        return try mFile.isHidden()
    }

    public func getSize() -> Int{
        return mFile.getSize()
    }

    public func create() throws -> Bool{
        let targetDirectory = mUrl.deletingLastPathComponent()
        try fileManager.createDirectory(at: targetDirectory, withIntermediateDirectories: true)
        return mFile.create()
    }

    public func getModificationDate() -> Date?{
        return mFile.getModificationDate()
    }

    public func getFile() -> File{
        return mFile
    }

}
