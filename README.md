# HK_DownloadBreakpoinResume
断点续传实现文件暂停、继续下载功能

*断点续传 -- 给服务器发送请求时，把所需要的位置给服务发过去

使用 NSURLSession实现断点续传
-(NSURLSessionDownloadTask*)downloadTaskWithURL:(NSURL*)url
-(NSURLSessionDownloadTask*)downloadTaskWithResumeData:(NSData*)resumeData
