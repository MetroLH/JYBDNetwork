//
//  JSCostomLoading.m
//  JYBD-Supplier
//
//  Created by liJiang on 2018/3/6.
//  Copyright © 2018年 JYBD.CN. All rights reserved.
//

#import "JSCostomLoading.h"

static CGFloat lineWidth = 3.0f;
#define BlueColor [UIColor colorWithRed:16/255.0 green:142/255.0 blue:233/255.0 alpha:1]

@implementation JSCostomLoading
{
    CADisplayLink *_link;
    CAShapeLayer *_animationLayer;
    
    CGFloat _startAngle;
    CGFloat _endAngle;
    CGFloat _progress;
}

+(JSCostomLoading*)showIn:(UIView*)view{
    [self hideIn:view];
    JSCostomLoading *hud = [[JSCostomLoading alloc] initWithFrame:view.bounds];
    [hud start];
    [view addSubview:hud];
    return hud;
}

+(JSCostomLoading *)hideIn:(UIView *)view{
    JSCostomLoading *hud = nil;
    for (JSCostomLoading *subView in view.subviews) {
        if ([subView isKindOfClass:[JSCostomLoading class]]) {
            [subView hide];
            [subView removeFromSuperview];
            hud = subView;
        }
    }
    return hud;
}

-(void)start{
    _link.paused = false;
}

-(void)hide{
    _link.paused = true;
    _progress = 0;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI{
    self.backgroundColor = [UIColor colorWithHexString:@"F4F4F4"];
    _animationLayer = [CAShapeLayer layer];
    _animationLayer.bounds = CGRectMake(0, 0, 50, 50);
    _animationLayer.position = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0);
    _animationLayer.fillColor = [UIColor clearColor].CGColor;
    _animationLayer.strokeColor = [UIColor orangeColor].CGColor;
    _animationLayer.lineWidth = lineWidth;
    _animationLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:_animationLayer];
    
    _tips = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    _tips.text = @"努力加载中...";
    _tips.textColor = [UIColor colorWithHexString:@"999999"];
    _tips.font = [UIFont systemFontOfSize:13];
    _tips.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_tips];
    
    [_tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(self.bounds.size.width/2.0f-30);
        make.top.equalTo(self).with.offset(self.bounds.size.height/2.0+35);
        make.right.equalTo(self).with.offset(self.bounds.size.width/2.0f-40);
    }];
    
    
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    _link.paused = true;
    
}

-(void)displayLinkAction{
    _progress += [self speed];
    if (_progress >= 1) {
        _progress = 0;
    }
    [self updateAnimationLayer];
}

-(void)updateAnimationLayer{
    _startAngle = -M_PI_2;
    _endAngle = -M_PI_2 +_progress * M_PI * 2;
    if (_endAngle > M_PI) {
        CGFloat progress1 = 1 - (1 - _progress)/0.25;
        _startAngle = -M_PI_2 + progress1 * M_PI * 2;
    }
    CGFloat radius = _animationLayer.bounds.size.width/2.0f - lineWidth/2.0f;
    CGFloat centerX = _animationLayer.bounds.size.width/2.0f;
    CGFloat centerY = _animationLayer.bounds.size.height/2.0f;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:radius startAngle:_startAngle endAngle:_endAngle clockwise:true];
    path.lineCapStyle = kCGLineCapRound;
    
    _animationLayer.path = path.CGPath;
}

-(CGFloat)speed{
    if (_endAngle > M_PI) {
        return 0.3/60.0f;
    }
    return 2/60.0f;
}

@end
