//
//  itemTableViewCell.h
//  表单
//
//  Created by Gavin on 16/6/20.
//  Copyright © 2016年 gavin. All rights reserved.
//
//
//嵌套itemHeadView
#import <UIKit/UIKit.h>
#import "itemHeadView.h"
@protocol itemTableViewCellDelegate <NSObject>

-(void)myHeadView:(itemHeadView *)headView point:(CGPoint)point;

@end
@interface itemTableViewCell : UITableViewCell
@property (nonatomic,assign) id<itemTableViewCellDelegate> delegate;

@end
