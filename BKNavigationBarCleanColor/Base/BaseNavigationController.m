//
//  BaseNavigationController.m
//  BKNavigationBarCleanColor
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 CloudRoom. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

/*
 <UINavigationBar: 0x7f8d29445600; frame = (0 0; 320 44); opaque = NO; autoresize = W; gestureRecognizers = <NSArray: 0x7f8d29447dc0>; layer = <CALayer: 0x7f8d2943cd00>>
 | <_UINavigationBarBackground: 0x7f8d29433d30; frame = (0 0; 320 44); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7f8d2943cac0>>
 |    | <UIImageView: 0x7f8d294465c0; frame = (0 44; 320 0.5); userInteractionEnabled = NO; layer = <CALayer: 0x7f8d29446900>>
 | <UINavigationItemView: 0x7f8d29436220; frame = (79 8; 162.5 27); opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x7f8d2940da90>>
 |    | <UILabel: 0x7f8d29433ed0; frame = (0 3.5; 162.5 21.5); text = 'Root View Controller'; opaque = NO; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7f8d29434080>>
 | <_UINavigationBarBackIndicatorView: 0x7f8d29661270; frame = (0 11.5; 13 21); alpha = 0; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x7f8d29660c20>>
 */
