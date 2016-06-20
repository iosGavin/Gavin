//
//  itemHeadView.m
//  表单
//
//  Created by Gavin on 16/6/20.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "itemHeadView.h"
@interface itemHeadView()
@property (nonatomic,strong) UILabel *numRoom;
@property (nonatomic,strong) UILabel *detailRoom;
@end

@implementation itemHeadView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self addSubview:({
            _numRoom = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            _numRoom.textAlignment = NSTextAlignmentCenter;
            _numRoom.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.25);
            _numRoom;
        })];
        
        [self addSubview:({
            _detailRoom = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.5)];
            _detailRoom.textAlignment = NSTextAlignmentCenter;
            _detailRoom.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height - self.frame.size.height * 0.25);
            _detailRoom;
        })];
        
        
        //给view添加点击事件
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)]];
    }
    return self;
}
- (void)tapView:(UITapGestureRecognizer *)tap{
//调用代理方法
    //获取点击的位置
    CGPoint point = [tap locationInView:self];
    if ([self.delegate respondsToSelector:@selector(headView:point:)]) {
        [self.delegate headView:self point:point];
    }

}
//设置数据
- (void)setNum:(NSString *)num{
    _num = num;
    self.numRoom.text = num;
}
- (void)setDetail:(NSString *)detail{
    _detail = detail;
    self.detailRoom.text = detail;
}
@end
