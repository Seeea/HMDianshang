//
//  FilePathUtil.h
//  ChinaMobileFinancePlatform
//
//  Created by xinxin on 14/12/29.
//  Copyright (c) 2014年 liuhegong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilePathUtil : NSObject


#pragma mark 根据文件名称返回文件全路径
+ (NSString *)filePathWithFileName:(NSString *)fileName;


#pragma mark 删除指定文件
+ (void) deleteFileByPath:(NSString *)filePath;
- (NSString *)writeToFileWithNSData:(NSData *)fileData fileName:(NSString *)fileName;


@end
