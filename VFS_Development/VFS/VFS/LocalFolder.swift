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
//  LocalFolder.swift
//  VFS
//
//  Created by waltoncob on 2016/12/5.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class LocalFolder:IFile{

    private var mUrl:URL
    private var mFolder:File
    private var mFactory:LocalFileFactory
    private let fileManager = FileManager.default

    public init(factory:LocalFileFactory, url:URL) throws{
        self.mFactory = factory;
        self.mUrl = url
        self.mFolder = try File(url:url)
    }

    public  func getType() -> FileType{
        return FileType.FOLDER;
    }

    public func move(file:IFile) throws -> Bool{
        guard let data = file as? LocalFolder else{
            throw IllegalArgumentError(info:"need to input LocalFolder")
        }
        if fileManager.fileExists(atPath: data.getUrl().path){
            self.mUrl = data.getUrl()
            self.mFolder = data.getFile()
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
        return mFolder.getName()
    }

    public func isExists() -> Bool{
        return mFolder.isExists()
    }

    public func isHidden() throws -> Bool?{
        return try mFolder.isHidden()
    }

    public func create() throws -> Bool{
        try fileManager.createDirectory(at: mUrl, withIntermediateDirectories: true)
        return true
    }

    public func getModificationDate() -> Date?{
        return mFolder.getModificationDate()
    }

    public func getFile() -> File{
        return mFolder
    }

    public func getchildren() throws -> [IFile] {
        var children:[IFile] = []
        let urls = try fileManager.contentsOfDirectory(at:mUrl, includingPropertiesForKeys:[.isHiddenKey])
        for url in urls{
            let file = try mFactory.getFile(url:url)
            children.append(file)
        }
        return children
    }

}
