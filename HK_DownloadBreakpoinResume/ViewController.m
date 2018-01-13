//
//  ViewController.m
//  HK_DownloadBreakpoinResume
//
//  Created by houke on 2018/1/13.
//  Copyright © 2018年 houke. All rights reserved.
//

#import "ViewController.h"
#import "HK_DownloadTask.h"
/*
 *断点续传 -- 给服务器发送请求时，把所需要的位置给服务发过去
 
 使用 NSURLSession实现断点续传
 -(NSURLSessionDownloadTask*)downloadTaskWithURL:(NSURL*)url
 -(NSURLSessionDownloadTask*)downloadTaskWithResumeData:(NSData*)resumeData
 
 
 */

@interface ViewController ()
{
    HK_DownloadTask *download;
    BOOL isPasue;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isPasue = NO;
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)downloadStart:(UIButton *)sender {
    
    if (download) {
        //继续下载
        if (isPasue) {
            [download resume];
            isPasue = NO;
        }
        
    }else{
        //开始下载
        download = [[HK_DownloadTask alloc] init];
        [download downloadTaskWithURL:[NSURL URLWithString:@"http://p1b0tkq2t.bkt.clouddn.com/dw.mp4"]];
    }
}

- (IBAction)downloadPasue:(UIButton *)sender {
    if (download) {
        [download pasue];
        isPasue = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
