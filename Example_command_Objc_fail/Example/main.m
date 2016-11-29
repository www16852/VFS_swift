//
//  main.m
//  Example
//
//  Created by waltoncob on 2016/11/29.
//  Copyright © 2016年 waltoncob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <VFS/VFS-Swift.h>
#import <VFS/VFS.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSLog(@"a = %f", VFSVersionNumber);
        LocalData *demo = [[LocalData alloc] init];
    }
    return 0;
}
