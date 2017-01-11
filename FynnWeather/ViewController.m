//
//  ViewController.m
//  FynnWeather
//
//  Created by FLYang on 2017/1/11.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import "ViewController.h"
#import "FYWeatherViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.homeView];
}

#pragma mark - init
- (FYHomeView *)homeView {
    if (!_homeView) {
        _homeView = [[FYHomeView alloc] initWithFrame:self.view.frame];
        _homeView.homeVC = self;
    }
    return _homeView;
}

@end
