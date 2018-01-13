//
//  HK_DownloadTask.m
//  HK_DownloadBreakpoinResume
//
//  Created by houke on 2018/1/13.
//  Copyright © 2018年 houke. All rights reserved.
//

#import "HK_DownloadTask.h"

@implementation HK_DownloadTask


/**
 初始化 session

 @return <#return value description#>
 */
-(NSURLSession *)session
{
    if (!_session) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

-(void)downloadTaskWithURL:(NSURL *)url
{
    self.task = [self.session downloadTaskWithURL:url];
    
    //开始下载任务
    [self.task resume];
}


/**
 暂停
 */
-(void)pasue
{
    NSLog(@"暂停下载任务");
    __weak typeof(self) weakSelf = self;
    [self.task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        weakSelf.resumeData = resumeData;
    }];
}


/**
 继续下载
 */
-(void)resume{
    NSLog(@"继续下载");
    self.task = [self.session downloadTaskWithResumeData:_resumeData];
    [self.task resume];
}
#pragma mark - NSURLSessionDownloadDelegate
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSLog(@"文件下载完成");
}

//正在下载
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    NSLog(@"下载进度：%f",(float)totalBytesWritten/totalBytesExpectedToWrite);
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
{
    
}
@end























