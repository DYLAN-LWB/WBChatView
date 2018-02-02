//
//  WBChatCell.h
//  WBChatView
//
//  Created by 李伟宾 on 2018/2/2.
//  Copyright © 2018年 李伟宾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBChatModel.h"

#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height


@interface WBChatCell : UITableViewCell
@property (nonatomic, strong) WBChatModel *model;
@end
