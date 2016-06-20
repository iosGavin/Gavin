//
//  IndexView.m
//  表单
//
//  Created by Gavin on 16/6/20.
//  Copyright © 2016年 gavin. All rights reserved.
//
#define KindexCount 20
#import "IndexView.h"
#import "IndexCell.h"
@interface IndexView ()<UITableViewDataSource,UITableViewDelegate>
//数据
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation IndexView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:({
            self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
            self.tableView.delegate=self;
            self.tableView.dataSource=self;
            self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
            //这个不可交互 如何滑动?
            
            self.tableView.userInteractionEnabled = NO;
            self.tableView;
            
        })];
        self.array = [NSMutableArray array];
        for (int i = 0; i<=KindexCount; i++) {
            NSString *detail = [NSString stringWithFormat:@"%d号产品",i];
            [self.array addObject:detail];
        }
        
    }
    return self;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lable = [[UILabel alloc] init];
    lable.text = @"基金产品";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.alpha = 1;
    return lable;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 40;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return KindexCount;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"cell";
    IndexCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        
        cell=[[IndexCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.indexLable.text=self.array[indexPath.row];
    return cell;
}

@end
