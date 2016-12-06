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
//  LocalFileFactory.swift
//  VFS
//
//  Created by waltoncob on 2016/11/29.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

import Foundation

public class LocalFileFactory{

    public init(){

    }

    public func getFile(url:URL) throws -> IFile{
        if url.scheme != "file"{
            throw IllegalArgumentError(info: "the url isn't used file scheme.")
        }
        let str = url.absoluteString
        print("sub = ",str.substring(from: str.index(str.endIndex, offsetBy: -1)))
        if str.substring(from: str.index(str.endIndex, offsetBy: -1)) == "/" {
            print("Folder")
            return try LocalFolder(factory:self,url:url)
        }else{
            print("Data")
            return try LocalData(factory:self,url:url)
        }
    }

}
