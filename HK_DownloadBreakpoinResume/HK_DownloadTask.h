//
//  HK_DownloadTask.h
//  HK_DownloadBreakpoinResume
//
//  Created by houke on 2018/1/13.
//  Copyright © 2018年 houke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HK_DownloadTask : NSObject<NSURLSessionDownloadDelegate>


/**
 下载任务
 */
@property (nonatomic, strong) NSURLSessionDownloadTask *task;


/**
 创建下载任务的属性
 */
@property (nonatomic, strong) NSURLSession *session;

/**
 保存完成的文件
 */
@property (nonatomic, strong) NSData *resumeData;


/**
 创建下载任务
 */
-(void)downloadTaskWithURL:(NSURL *)url;

/**
 暂停
 */
-(void)pasue;

/**
 继续下载
 */
-(void)resume;
@end
