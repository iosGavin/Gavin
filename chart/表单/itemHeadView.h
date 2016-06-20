//
//  itemHeadView.h
//  表单
//
//  Created by Gavin on 16/6/20.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class itemHeadView;
@protocol itemHeadViewDelegate <NSObject>
//点击的哪个表头//主cell
- (void)headView:(itemHeadView *)headView point:(CGPoint)point;

@end
@interface itemHeadView : UIView
@property (nonatomic,strong) NSString *num;
@property (nonatomic,strong) NSString *detail;

@property (nonatomic,assign) id<itemHeadViewDelegate> delegate;

@end
