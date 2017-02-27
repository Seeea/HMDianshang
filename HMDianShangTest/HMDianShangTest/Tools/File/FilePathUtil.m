//
//  FilePathUtil.m
//  ChinaMobileFinancePlatform
//  返回安全沙盒文件地址
//  Created by xinxin on 14/12/29.
//  Copyright (c) 2014年 liuhegong. All rights reserved.
//

#import "FilePathUtil.h"

@implementation FilePathUtil

+ (NSString *)filePathWithFileName:(NSString *)fileName
{
    NSString *dirPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] ;
    NSLog(@"dirPath = %@",dirPath);
    return [NSString stringWithFormat:@"%@/%@",dirPath,fileName];
}


#pragma mark 删除指定文件
+ (void) deleteFileByPath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager isDeletableFileAtPath:filePath]){
        
        [fileManager removeItemAtPath:filePath error:nil];
    }
}
- (NSString *)writeToFileWithNSData:(NSData *)data fileName:(NSString *)file{
    NSArray *dir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);//获得Library/Caches目录，该目录程序退出不会清空，iTunes也不备份此目录
    NSString *cDownloadBaseFolderPath = [[dir objectAtIndex:0] stringByAppendingPathComponent:@"FMADownload"];//创建Library/Caches/FMADownload目录作为下载目录
    NSString *filePath = [cDownloadBaseFolderPath stringByAppendingPathComponent:file];//根据文件名和路径构建出文件的绝对路径
    NSLog(@"filePath = %@",filePath);
    NSFileManager *fm = [NSFileManager defaultManager];//获取文件管理器
    [fm removeItemAtPath:filePath error:nil];//如果文件已经存在则移除该文件，文件不存在时也不会抛出异常，如果想捕获提示信息，可以定义一个NSError传递给error参数即可
    NSLog(@"fm = %@",fm);
    if([data writeToFile:filePath atomically:YES])//以原子处理的方式将内容写进文件中
    {
        return filePath;
    }
    else  
    {  
        return nil;  
    }


}
@end
