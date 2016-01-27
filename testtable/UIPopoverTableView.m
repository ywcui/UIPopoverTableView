//
//  UIPopoverTableView.m
//  XQBCommunityApp
//
//  Created by City--Online on 16/1/27.
//  Copyright © 2016年 CityOnline_1. All rights reserved.
//

#import "UIPopoverTableView.h"

@interface UIPopoverTableView ()
@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UIView *footerView;
@end

@implementation UIPopoverTableView
-(void)showInView:(UIView*)view withFrame:(CGRect)frame
{
    _overlayView = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    _overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
    
    [_overlayView addTarget:self
                     action:@selector(cancelClick)
           forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_overlayView];
    [self initUIWithView:view withFrame:frame];
}
-(void)initUIWithView:(UIView *)view  withFrame:(CGRect)frame
{
    _contentView=[[UIView alloc]initWithFrame:frame];
    _contentView.layer.cornerRadius=_contentViewCornerRadius;
    _contentView.clipsToBounds=YES;
    if (self.popoverDelegate&&[self.popoverDelegate respondsToSelector:@selector(popTableHeadView:)]) {
        _headView=[self.popoverDelegate popTableHeadView:self];
    }
    if (self.popoverDelegate&&[self.popoverDelegate respondsToSelector:@selector(popTableFooterView:)]) {
        _footerView=[self.popoverDelegate popTableFooterView:self];
        _footerView.frame=CGRectMake(_footerView.frame.origin.x, frame.size.height-_footerView.frame.size.height, _footerView.frame.size.width, _footerView.frame.size.height);
    }
    
    float tableHeight=frame.size.height-_headView.frame.size.height-_footerView.frame.size.height;
    self.frame=CGRectMake(0, _headView.frame.size.height, frame.size.width, tableHeight);
    [_contentView addSubview:_headView];
    [_contentView addSubview:self];
    [_contentView addSubview:_footerView];
    [view addSubview:_contentView];
    [self fadeIn];
}
- (void)fadeIn
{
    _contentView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    _contentView.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        _contentView.alpha = 1;
        _contentView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)fadeOut
{
    [UIView animateWithDuration:.35 animations:^{
        _contentView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        _contentView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [_overlayView removeFromSuperview];
            [_contentView removeFromSuperview];
        }
    }];
}
-(void)cancelClick
{
    if (self.popoverDelegate&&[self.popoverDelegate respondsToSelector:@selector(popoverTableViewCancel:)]) {
        [self.popoverDelegate popoverTableViewCancel:self];
    }
    [self fadeOut];
}
@end
