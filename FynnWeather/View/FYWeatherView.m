//
//  FYWeatherView.m
//  FynnWeather
//
//  Created by FLYang on 2017/1/11.
//  Copyright © 2017年 Fynn. All rights reserved.
//

#import "FYWeatherView.h"
#import "WeatherDailyForecast.h"

static NSInteger const indexLableTag = 100;

@implementation FYWeatherView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:MAIN_COLOR];
        [self setViewUI];
    }
    return self;
}

#pragma mark - 使用model赋值
- (void)fy_setWeatherDataModel:(WeatherHeWeather5 *)model {
    [self fy_setTmpLableAttributedString:model.now.tmp];
    [self fy_setCity:model.basic.city cond:model.now.cond.txt];
    [self fy_setTipLableAttributedString:model.suggestion.comf.txt];
    [self fy_setMaxAndMinTmp:model.dailyForecast[0]];
    [self fy_setIndexData:model];
}

#pragma mark - 设置UI布局
- (void)setViewUI {
    [self addSubview:self.topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT *0.67));
        make.left.top.equalTo(self).with.offset(0);
    }];
    
    [self addSubview:self.botView];
    [_botView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(SCREEN_WIDTH));
        make.bottom.left.equalTo(self).with.offset(0);
        make.top.equalTo(_topView.mas_bottom).with.offset(0);
    }];
}

#pragma mark - 顶部指数视图
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor colorWithHexString:MAIN_COLOR];
        
        [_topView addSubview:self.closeBtn];
        [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(32, 32));
            make.right.equalTo(_topView.mas_right).with.offset(-10);
            make.top.equalTo(_topView.mas_top).with.offset(10);
        }];
        
        [_topView addSubview:self.tmpLable];
        [_tmpLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(200, 120));
            make.left.equalTo(_topView.mas_left).with.offset(20);
            make.top.equalTo(_topView.mas_top).with.offset(0);
        }];
        
        [_topView addSubview:self.condLable];
        [_condLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(200, 16));
            make.left.equalTo(_topView.mas_left).with.offset(20);
            make.top.equalTo(_tmpLable.mas_bottom).with.offset(0);
        }];
        
        [_topView addSubview:self.condImage];
        [_condImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(150, 150));
            make.top.equalTo(_condLable.mas_bottom).with.offset(40);
            make.centerX.equalTo(_topView);
        }];
        
        [_topView addSubview:self.tipLable];
        [_tipLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - 40, 40));
            make.left.equalTo(_topView.mas_left).with.offset(20);
            make.bottom.equalTo(_topView.mas_bottom).with.offset(-20);
        }];
        
    }
    return _topView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc] init];
        [_closeBtn setImage:[UIImage imageNamed:@"icon_close"] forState:(UIControlStateNormal)];
        [_closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _closeBtn;
}

- (void)closeBtnClick:(UIButton *)button {
    CATransition * animation = [CATransition animation];
    animation.duration = 1;
    animation.type = @"rippleEffect";
    animation.subtype = kCATransitionFromTop;
    [self.selfVC.view.window.layer addAnimation:animation forKey:nil];
    [self.selfVC dismissViewControllerAnimated:YES completion:nil];
}

- (UILabel *)tmpLable {
    if (!_tmpLable) {
        _tmpLable = [[UILabel alloc] init];
        _tmpLable.textColor = [UIColor whiteColor];
        _tmpLable.font = [UIFont boldSystemFontOfSize:100];
    }
    return _tmpLable;
}

- (UILabel *)condLable {
    if (!_condLable) {
        _condLable = [[UILabel alloc] init];
        _condLable.textColor = [UIColor whiteColor];
        _condLable.font = [UIFont systemFontOfSize:16];
    }
    return _condLable;
}

- (UIImageView *)condImage {
    if (!_condImage) {
        _condImage = [[UIImageView alloc] init];
        _condImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _condImage;
}

- (UILabel *)tipLable {
    if (!_tipLable) {
        _tipLable = [[UILabel alloc] init];
        _tipLable.textColor = [UIColor whiteColor];
        _tipLable.numberOfLines = 2;
    }
    return _tipLable;
}

#pragma mark - 底部指数视图
- (UIView *)botView {
    if (!_botView) {
        _botView = [[UIView alloc] init];
        _botView.backgroundColor = [UIColor whiteColor];
        
        [_botView addSubview:self.minLable];
        [_minLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 20));
            make.left.equalTo(_botView.mas_left).with.offset(20);
            make.top.equalTo(_botView.mas_top).with.offset(30);
        }];
        
        [_botView addSubview:self.maxLable];
        [_maxLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 20));
            make.right.equalTo(_botView.mas_right).with.offset(-20);
            make.top.equalTo(_botView.mas_top).with.offset(30);
        }];
        
        [_botView addSubview:self.tmpIcon];
        [_tmpIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.equalTo(_botView.mas_top).with.offset(25);
            make.centerX.equalTo(_botView);
        }];
        
        [_botView addSubview:self.indexView];
        [self.indexView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH - 20, 60));
            make.left.equalTo(_botView.mas_left).with.offset(10);
            make.top.equalTo(_tmpIcon.mas_bottom).with.offset(30);
        }];
    }
    return _botView;
}

- (UILabel *)minLable {
    if (!_minLable) {
        _minLable = [[UILabel alloc] init];
        _minLable.textColor = [UIColor colorWithHexString:MAIN_COLOR];
        _minLable.font = [UIFont boldSystemFontOfSize:20];
    }
    return _minLable;
}

- (UILabel *)maxLable {
    if (!_maxLable) {
        _maxLable = [[UILabel alloc] init];
        _maxLable.textColor = [UIColor colorWithHexString:MAIN_COLOR];
        _maxLable.font = [UIFont boldSystemFontOfSize:20];
        _maxLable.textAlignment = NSTextAlignmentRight;
    }
    return _maxLable;
}

- (UIImageView *)tmpIcon {
    if (!_tmpIcon) {
        _tmpIcon = [[UIImageView alloc] init];
        _tmpIcon.contentMode = UIViewContentModeScaleAspectFit;
        _tmpIcon.image = [UIImage imageNamed:@"icon_tmp"];
    }
    return _tmpIcon;
}

- (UIView *)indexView {
    if (!_indexView) {
        _indexView = [[UIView alloc] init];
        _indexView.backgroundColor = [UIColor whiteColor];
    }
    return _indexView;
}

- (void)createWeatherIndex:(NSArray *)indexArr {
    for (NSUInteger idx = 0; idx < 6; idx++) {
        UILabel *indexLab = [[UILabel alloc] init];
        indexLab.font = [UIFont systemFontOfSize:14];
        indexLab.textColor = [UIColor colorWithHexString:MAIN_COLOR];
        indexLab.text = indexArr[idx];
        indexLab.tag = indexLableTag + idx;
        indexLab.textAlignment = NSTextAlignmentCenter;
        [self.indexView addSubview:indexLab];
        [indexLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH -30)/3, 25));
            make.left.mas_equalTo(((SCREEN_WIDTH -30)/3 +5) *(idx %3));
            make.top.mas_equalTo((idx /3) +(idx /3) *(60 /2));
        }];
    }
    
    for (NSUInteger jdx = 0; jdx < 2; jdx++) {
        UILabel *lineLab = [[UILabel alloc] init];
        lineLab.backgroundColor = [UIColor colorWithHexString:MAIN_COLOR];
        [self.indexView addSubview:lineLab];
        [lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(0.5, 40));
            make.left.mas_equalTo(((SCREEN_WIDTH -30)/3 +3) *(jdx +1));
            make.centerY.equalTo(self.indexView);
        }];
    }
    
    UILabel *acrossline = [[UILabel alloc] initWithFrame:CGRectMake(10, 29, SCREEN_WIDTH -40, 0.5)];
    acrossline.backgroundColor = [UIColor colorWithHexString:MAIN_COLOR];
    [self.indexView addSubview:acrossline];
    
}

#pragma mark - 赋值的方法
- (void)fy_setTmpLableAttributedString:(NSString *)tmp {
    NSString *tmpStr = [NSString stringWithFormat:@"%@°", tmp];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:tmpStr];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:120] range:NSMakeRange(0, tmpStr.length -1)];
    [attString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:40] range:NSMakeRange(tmpStr.length -1, 1)];
    [attString addAttribute:NSBaselineOffsetAttributeName value:@((120 - 20)/2) range:NSMakeRange(tmpStr.length -1, 1)];
    _tmpLable.attributedText = attString;
}

- (void)fy_setTipLableAttributedString:(NSString *)tip {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 4.0f;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:tip];
    [attString setAttributes:@{
                               NSParagraphStyleAttributeName: paragraphStyle,
                               NSFontAttributeName:[UIFont systemFontOfSize:12]
                               }
                       range:(NSMakeRange(0, tip.length))];
    
    _tipLable.attributedText = attString;
}

- (void)fy_setCity:(NSString *)city cond:(NSString *)cond {
    self.condLable.text = [NSString stringWithFormat:@"%@ | %@", city, cond];
    [self fy_setTmpStateImage:cond];
}

- (void)fy_setMaxAndMinTmp:(WeatherDailyForecast *)model {
    self.minLable.text = [NSString stringWithFormat:@"%@° >", model.tmp.min];
    self.maxLable.text = [NSString stringWithFormat:@"< %@°", model.tmp.max];
}

- (void)fy_setIndexData:(WeatherHeWeather5 *)model {
    WeatherDailyForecast *dailyForecast = model.dailyForecast[0];
    NSString *pm25 = [NSString stringWithFormat:@"PM2.5：%@", [self fy_getDataStr:model.aqi.city.pm25]];
    NSString *pm10 = [NSString stringWithFormat:@"PM10：%@", [self fy_getDataStr:model.aqi.city.pm10]];
    NSString *quality = [NSString stringWithFormat:@"空气：%@", [self fy_getDataStr:model.aqi.city.qlty]];
    NSString *wind = [NSString stringWithFormat:@"%@：%@",dailyForecast.wind.dir, dailyForecast.wind.sc];
    //  无持续风向
    if ([dailyForecast.wind.dir containsString:@"无持续"]) {
        wind = [NSString stringWithFormat:@"%@",dailyForecast.wind.dir];
    }
    NSString *humidity = [NSString stringWithFormat:@"湿度：%@", dailyForecast.hum];
    NSString *rainfall = [NSString stringWithFormat:@"降水概率：%@", dailyForecast.pop];
    NSArray *indexArr = @[pm25, pm10, quality, wind, humidity, rainfall];
    
    [self createWeatherIndex:indexArr];
}

- (NSString *)fy_getDataStr:(NSString *)string {
    NSString *dataString;
    if (string.length) {
        dataString = string;
    } else {
        dataString = @"无结果";
    }
    return dataString;
}

- (void)fy_setTmpStateImage:(NSString *)cond {
    //  天气状态码对应标识没有参数说明，根据文字简单判断吧
    if ([cond containsString:@"雾"]) {
        self.condImage.image = [UIImage imageNamed:@"weather_state_fog"];
    } else if ([cond containsString:@"云"]) {
        self.condImage.image = [UIImage imageNamed:@"weather_state_clouds"];
    } else if ([cond containsString:@"雷"]) {
        self.condImage.image = [UIImage imageNamed:@"weather_state_lightning"];
    } else if ([cond containsString:@"雪"]) {
        self.condImage.image = [UIImage imageNamed:@"weather_state_snowflakes"];
    } else if ([cond containsString:@"晴"]) {
        self.condImage.image = [UIImage imageNamed:@"weather_state_sun"];
    } else if ([cond containsString:@"雨"]) {
        self.condImage.image = [UIImage imageNamed:@"weather_state_rain"];
    }
}


@end
