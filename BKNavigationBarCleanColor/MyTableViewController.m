//
//  MyTableViewController.m
//  BKNavigationBarCleanColor
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 CloudRoom. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController () < UINavigationControllerDelegate >
{
    UIView *_navigationBarBackground;
}

@end

@implementation MyTableViewController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUIScreenForMyTableViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

#pragma mark - UITableViewDataSource and UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        [cell setBackgroundColor:[UIColor redColor]];
    }
    
    [cell.textLabel setText:[NSString stringWithFormat:@"第%zd行",indexPath.row]];
    
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat alaph = 1 - (scrollView.contentOffset.y + 64) / 1200.0;
    
    alaph = alaph < 0 ? 0 : alaph;
    
    _navigationBarBackground.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:alaph];
}

#pragma mark - private methods
- (void)setupUIScreenForMyTableViewController
{
    // UINavigationBar固定为透明色
//    [self testOne];
    
    // UINavigationBar渐变为透明色
    [self testTwo];
}

- (void)testOne
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forBarMetrics:UIBarMetricsDefault];
    
    [self hiddenNavigationBarBackgroundSeparatorLine:self.navigationController.navigationBar];
}

- (void)testTwo
{
    [self getUINavigationBarBackgroundView:self.navigationController.navigationBar];
}

- (void)getUINavigationBarBackgroundView:(UIView *)superView
{
    if ([superView isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")] == YES)
    {
        _navigationBarBackground = superView;
        
        //在这里可设置背景色
        _navigationBarBackground.backgroundColor = [UIColor orangeColor];
        
        // hidden the separatorLine
        [self hiddenSeparatorLine:superView];
    }
    else if ([superView isKindOfClass:NSClassFromString(@"_UIBackdropView")] == YES)
    {
        // _UIBackdropEffectView is the subView of _UIBackdropView
        superView.hidden = YES;
    }
    
    for (UIView *subView in superView.subviews)
    {
        [self getUINavigationBarBackgroundView:subView];
        
        NSLog(@"%@:%@",subView,[subView subviews]);
    }
}

- (void)hiddenSeparatorLine:(UIView *)superView
{
    for (UIView *subView in superView.subviews)
    {
        if ([subView isKindOfClass:[UIImageView class]] == YES)
        {
            subView.hidden = YES;
        }
    }
}

- (void)hiddenNavigationBarBackgroundSeparatorLine:(UIView *)superView
{
    if ([superView isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")] == YES)
    {
        // remove the separatorLine
        [self hiddenSeparatorLine:superView];
    }
    
    for (UIView *subView in superView.subviews)
    {
        [self hiddenNavigationBarBackgroundSeparatorLine:subView];
    }
}

@end

/*
 2015-07-29 10:16:56.729 BKNavigationBarCleanColor[3807:39719] <_UIBackdropEffectView: 0x7ffcf0642490; frame = (0 0; 320 64); clipsToBounds = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <CABackdropLayer: 0x7ffcf0642bf0>>:(
 )
 2015-07-29 10:16:56.730 BKNavigationBarCleanColor[3807:39719] <UIView: 0x7ffcf0643a60; frame = (0 0; 320 64); hidden = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <CALayer: 0x7ffcf0643b70>>:(
 )
 2015-07-29 10:16:56.730 BKNavigationBarCleanColor[3807:39719] <_UIBackdropView: 0x7ffcf04a9860; frame = (0 0; 320 64); hidden = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <_UIBackdropViewLayer: 0x7ffcf0641260>>:(
 "<_UIBackdropEffectView: 0x7ffcf0642490; frame = (0 0; 320 64); clipsToBounds = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <CABackdropLayer: 0x7ffcf0642bf0>>",
 "<UIView: 0x7ffcf0643a60; frame = (0 0; 320 64); hidden = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <CALayer: 0x7ffcf0643b70>>"
 )
 2015-07-29 10:16:56.731 BKNavigationBarCleanColor[3807:39719] <UIImageView: 0x7ffcf049aea0; frame = (0 64; 320 0.5); userInteractionEnabled = NO; layer = <CALayer: 0x7ffcf049b1e0>>:(
 )
 2015-07-29 10:16:56.731 BKNavigationBarCleanColor[3807:39719] <_UINavigationBarBackground: 0x7ffcf049a7e0; frame = (0 -20; 320 64); autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x7ffcf049a770>>:(
 "<_UIBackdropView: 0x7ffcf04a9860; frame = (0 0; 320 64); hidden = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <_UIBackdropViewLayer: 0x7ffcf0641260>>",
 "<UIImageView: 0x7ffcf049aea0; frame = (0 64; 320 0.5); userInteractionEnabled = NO; layer = <CALayer: 0x7ffcf049b1e0>>"
 )
 2015-07-29 10:16:56.738 BKNavigationBarCleanColor[3807:39719] <UILabel: 0x7ffcf06316d0; frame = (0 3.5; 162.5 21.5); text = 'Root View Controller'; opaque = NO; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7ffcf061a970>>:(
 )
 2015-07-29 10:16:56.738 BKNavigationBarCleanColor[3807:39719] <UINavigationItemView: 0x7ffcf061a820; frame = (79 8; 162.5 27); opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x7ffcf0622830>>:(
 "<UILabel: 0x7ffcf06316d0; frame = (0 3.5; 162.5 21.5); text = 'Root View Controller'; opaque = NO; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x7ffcf061a970>>"
 )
 2015-07-29 10:16:56.739 BKNavigationBarCleanColor[3807:39719] <_UINavigationBarBackIndicatorView: 0x7ffcf0736100; frame = (0 11.5; 13 21); alpha = 0; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x7ffcf07353d0>>:(
 )
 
 由此看出视图结构:
 UINavigationBar
 -- _UINavigationBarBackground
 ---- _UIBackdropView
 ------ _UIBackdropEffectView
 ---- UIImageView
 */
