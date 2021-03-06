//
//  QWDetailWebController.m
//  QW京东Demo
//
//  Created by mac on 16/1/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QWDetailWebController.h"

#define QWProductDetailURL      @"http://item.m.jd.com/detail/skuId.html?resourceType=list&resourceValue=655&sid=5a2c9d66e416af2abbefcbab7ede95bd"

@interface QWDetailWebController ()

// 商品编号skuId
@property (nonatomic, copy) NSString *skuId;

@end

@implementation QWDetailWebController

#pragma mark -初始化
- (instancetype)initWithSkuId:(NSString *)skuId {
    self = [super init];
    
    if (self) {
        _skuId = skuId;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1. 创建webView, 展示详情页面
    UIWebView *detailWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    // 根据屏幕大小自动调整页面尺寸
    detailWebView.scalesPageToFit = YES;
    
    [self.view addSubview:detailWebView];
    
    // 2. 设置请求URL
    NSString *URLString = QWProductDetailURL;
    URLString = [URLString stringByReplacingOccurrencesOfString:@"skuId" withString:_skuId];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    // 加载页面
    [detailWebView loadRequest:request];
}


@end
