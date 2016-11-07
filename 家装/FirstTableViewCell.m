//
//  FirstTableViewCell.m
//  家装
//
//  Created by mac on 16/5/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
   // NSLog(@"cellForRowAtIndexPath");
    static NSString *identifier = @"status";
    // 1.缓存中取
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
     // 2.创建
    if (cell == nil)
    {
        cell = [[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
