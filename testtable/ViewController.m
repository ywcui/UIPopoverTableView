//
//  ViewController.m
//  testtable
//
//  Created by City--Online on 16/1/27.
//  Copyright © 2016年 City--Online. All rights reserved.
//

#import "ViewController.h"
#import "UIPopoverTableView.h"
#import "MyTableView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,PopoverTableViewDelegate>
@property (nonatomic,strong) UIPopoverTableView *popTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    
    btn.frame=CGRectMake(100, 100, 100, 80);
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn1 setTitle:@"click1" forState:UIControlStateNormal];
    
    btn1.frame=CGRectMake(100, 200, 100, 80);
    [btn1 addTarget:self action:@selector(click1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}
-(void)click:(id)sender
{
    self.popTableView.contentViewCornerRadius=15;
    [self.popTableView showInView:self.view withFrame:CGRectMake(0, (self.view.frame.size.height-400)/2, self.view.frame.size.width, 400)];
}
-(void)click1:(id)sender
{
    [self.popTableView showInView:self.view withFrame:CGRectMake(0, (self.view.frame.size.height-300)/2, self.view.frame.size.width, 300)];
}
-(UIPopoverTableView *)popTableView
{
    if (!_popTableView) {
        _popTableView =[[MyTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
        _popTableView.delegate=self;
        _popTableView.dataSource=self;
        _popTableView.popoverDelegate=self;
        _popTableView.backgroundColor=[UIColor redColor];
        [_popTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//        _popTableView.layer.cornerRadius=10;
       
    }
    return _popTableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [(UIPopoverTableView *)tableView fadeOut];
    NSLog(@"%@",indexPath);
    
}
-(UIView *)popTableHeadView:(UITableView *)tableView
{
//    return [[UIView alloc]initWithFrame:CGRectZero];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    label.text=@"HeadTitle";
    label.font=[UIFont systemFontOfSize:20];
    [label setTextColor:[UIColor blueColor]];
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor whiteColor];
    return label;
}
-(UIView *)popTableFooterView:(UITableView *)tableView
{
//    return [[UIView alloc]initWithFrame:CGRectZero];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    label.text=@"FotterTitle";
    label.font=[UIFont systemFontOfSize:20];
    [label setTextColor:[UIColor blueColor]];
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor whiteColor];
    return label;
}
- (void)popoverTableViewCancel:(UITableView *)popTableView
{
    NSLog(@"popoverTableViewCancel");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
