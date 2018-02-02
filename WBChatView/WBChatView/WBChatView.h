//
//  WBChatView.h
//  WBChatView
//
//  Created by 李伟宾 on 2018/2/2.
//  Copyright © 2018年 李伟宾. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "WBChatCell.h"

@protocol WBChatViewDelegate <NSObject>
- (void)sendMessage:(NSInteger)type text:(NSString *)text;
@end

@interface WBChatView : UIView

@property (nonatomic, strong) NSMutableArray *chatMsg;
@property (nonatomic, weak) id<WBChatViewDelegate> delegate;

@end
