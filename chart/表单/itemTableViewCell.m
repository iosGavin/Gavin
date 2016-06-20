//
//  itemTableViewCell.m
//  表单
//
//  Created by Gavin on 16/6/20.
//  Copyright © 2016年 gavin. All rights reserved.
//

#import "itemTableViewCell.h"
@interface itemTableViewCell()<itemHeadViewDelegate>
@end
@implementation itemTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        for (int i = 0; i <20; i++) {
            
            itemHeadView *headView = [[itemHeadView alloc] initWithFrame:CGRectMake(i*100, 0, 100 - 1, 40 + 3)];
            headView.delegate = self;
            headView.num = [NSString stringWithFormat:@"%d",i];
            headView.detail = @"不推荐";
            if ( (i == 3) ||  (i == 1) || (i == 9) ||  (i == 5)){
            
                headView.detail = @"强烈推荐";
            
            }

            headView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];            [self.contentView addSubview:headView];
        }
    }
    return self;
}
//实现代理方法
- (void)headView:(itemHeadView *)headView point:(CGPoint)point{
    //代理嵌套出去
    if([self.delegate respondsToSelector:@selector(myHeadView:point:)]){
        
        [self.delegate myHeadView:headView point:point];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
