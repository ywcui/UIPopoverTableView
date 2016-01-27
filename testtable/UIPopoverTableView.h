//
//  UIPopoverTableView.h
//  XQBCommunityApp
//
//  Created by City--Online on 16/1/27.
//  Copyright © 2016年 CityOnline_1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class UIPopoverTableView;

@protocol PopoverTableViewDelegate <NSObject>

@optional
//头部视图
-(UIView *)popTableHeadView:(UITableView *)tableView;
//顶部试图
-(UIView *)popTableFooterView:(UITableView *)tableView;
//取消
- (void)popoverTableViewCancel:(UITableView *)popTableView;
@end

@interface UIPopoverTableView : UITableView

@property (nonatomic,strong) UIControl *overlayView;

@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,assign) float contentViewCornerRadius;

@property (nonatomic, assign) id<PopoverTableViewDelegate> popoverDelegate;

//在父视图view的相对位置为Frame
-(void)showInView:(UIView*)view withFrame:(CGRect)frame;

//下面两个方法主要是为了子类定义弹入弹出动画
//显示的动画效果
- (void)fadeIn;

//显示的动画效果
- (void)fadeOut;

@end