//
//  MyTableView.m
//  testtable
//
//  Created by City--Online on 16/1/27.
//  Copyright © 2016年 City--Online. All rights reserved.
//

#import "MyTableView.h"

@implementation MyTableView

- (void)fadeIn
{
    
    self.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, self.contentView.frame.size.height);
    [UIView animateWithDuration:.35 animations:^{
        self.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-self.contentView.frame.size.height, [UIScreen mainScreen].bounds.size.width, self.contentView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];

}
- (void)fadeOut{
    
        
        [UIView animateWithDuration:.35 animations:^{
               self.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, self.contentView.frame.size.height);
        } completion:^(BOOL finished) {
            if (finished) {
                [self.overlayView removeFromSuperview];
                [self.contentView removeFromSuperview];
            }
        }];
    
}

@end
