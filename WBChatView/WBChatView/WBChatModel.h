//
//  WBChatModel.h
//  WBChatView
//
//  Created by 李伟宾 on 2018/2/2.
//  Copyright © 2018年 李伟宾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBChatModel : NSObject

typedef NS_ENUM(NSInteger, MsgType) {
    MsgTypeIsText    = 1
};

typedef NS_ENUM(NSInteger, MsgFrom) {
    MsgFromIsLeft   = 1,
    MsgFromIsRight  = 2
};


/** 消息类型 1文字 */
@property (readwrite, assign) MsgType msgType;
/** 消息位置 1收到的消息 2发出的消息 */
@property (readwrite, assign) MsgFrom msgFrom;
/** 消息文字*/
@property (nonatomic, copy) NSString *msgText;
@end
