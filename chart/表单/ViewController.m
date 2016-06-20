//
//  ViewController.m
//  表单
//
//  Created by Gavin on 16/6/20.
//  Copyright © 2016年 gavin. All rights reserved.
//
#define kCount 20
#define kWidth 100
#define kHeight 40
#import "ViewController.h"
#import "itemHeadView.h"
#import "itemTableViewCell.h"
#import "IndexView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,itemTableViewCellDelegate>
@property (nonatomic, weak) UIView *headView;
@property (nonatomic, strong) IndexView *indexView;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"会议管理";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupHeadView];
    [self setupChart];
}
//设置表头
- (void)setupHeadView{

    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kCount * kWidth , kHeight)];
    _headView = headView;
    //详细的表头
    for (int i = 0; i<kCount; i++) {
        [headView addSubview:({
            itemHeadView *item = [[itemHeadView alloc] initWithFrame:CGRectMake(i * kWidth, 0, kWidth, kHeight)];
            item.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
            item.num = [NSString stringWithFormat:@"收益率%02d",i];
            item.detail = @"查看净值";
            [headView addSubview:item];
            item;
        })];
    }
    [self.view addSubview:headView];
}
//设置表体内容
- (void)setupChart{
    //
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.headView.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.backgroundColor = [UIColor redColor];
        tableView;
    });
    //在scrollView中添加tableVIew
    [self.view addSubview:({
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(kWidth, 0, self.view.frame.size.width - kWidth, self.view.frame.size.height)];
        scrollView.backgroundColor = [UIColor colorWithRed:21 green:123 blue:12 alpha:0.5];
        //设置滚动内容0默认不设置
        scrollView.contentSize =CGSizeMake(self.headView.frame.size.width, 0);
        [scrollView addSubview:self.tableView];
        scrollView;
        
    })];
    //添加左边索引,也是一个tableview
    [self.view addSubview:({
        self.indexView = [[IndexView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kCount * (kHeight))];
        self.indexView;
    })];
}
#pragma mark 代理方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return self.headView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return kHeight;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kCount-1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    
    itemTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        
        cell=[[itemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.delegate=self;
        cell.backgroundColor=[UIColor grayColor];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
}
//实现代理方法
- (void)myHeadView:(itemHeadView *)headView point:(CGPoint)point
{
    //从headview算出在 tableview的位置
    CGPoint Mypoint = [self.tableView convertPoint:point fromView:headView];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"点击了%@",NSStringFromCGPoint(Mypoint)] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    
}
//让左边随着右边滚动而滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY= self.tableView.contentOffset.y;
    CGPoint timeOffsetY=self.indexView.tableView.contentOffset;
    timeOffsetY.y=offsetY;
    self.indexView.tableView.contentOffset=timeOffsetY;
    if(offsetY==0){
        self.indexView.tableView.contentOffset=CGPointZero;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
