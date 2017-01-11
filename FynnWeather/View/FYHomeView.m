//
//  FYHomeView.m
//  FynnWeather
//
//  Created by FLYang on 2017/1/11.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import "FYHomeView.h"
#import "FYWeatherViewController.h"

@implementation FYHomeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        [self setViewUI];
    }
    return self;
}

#pragma mark - 设置视图
- (void)setViewUI {
    [self addSubview:self.logoImagae];
    
    [self addSubview:self.goButton];
}

#pragma mark - init
- (UIImageView *)logoImagae {
    if (!_logoImagae) {
        _logoImagae = [[UIImageView alloc] init];
        _logoImagae = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 -100, SCREEN_HEIGHT/2 -200, 200, 200)];
        _logoImagae.image = [UIImage imageNamed:@"github"];
        _logoImagae.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _logoImagae;
}

- (UIButton *)goButton {
    if (!_goButton) {
        _goButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 -50, SCREEN_HEIGHT -100, 100, 40)];
        _goButton.backgroundColor = [UIColor whiteColor];
        _goButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_goButton setTitle:@"查看天气" forState:(UIControlStateNormal)];
        [_goButton setTitleColor:[UIColor colorWithHexString:MAIN_COLOR] forState:(UIControlStateNormal)];
        [_goButton addTarget:self action:@selector(openWeatherVC:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _goButton;
}

- (void)openWeatherVC:(UIButton *)button {
    CATransition * animation = [CATransition animation];
    animation.duration = 1;
    animation.type = @"rippleEffect";
    animation.subtype = kCATransitionFromTop;
    [self.homeVC.view.window.layer addAnimation:animation forKey:nil];
    
    FYWeatherViewController *weatherVC = [[FYWeatherViewController alloc] init];
    [self.homeVC presentViewController:weatherVC animated:YES completion:nil];
    
}

@end
