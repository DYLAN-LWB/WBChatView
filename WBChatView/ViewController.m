//
//  ViewController.m
//  WBChatView
//
//  Created by 李伟宾 on 2018/2/2.
//  Copyright © 2018年 李伟宾. All rights reserved.
//


#import "ViewController.h"
#import "WBChatView.h"

@interface ViewController () <WBChatViewDelegate>
@property (nonatomic, strong) WBChatView *chatView;
@property (nonatomic, strong) NSMutableArray *chatMsg;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    self.chatMsg = [NSMutableArray array];
    
    self.chatView = [[WBChatView alloc] init];
    self.chatView.frame = CGRectMake(0, SCREEN_HEIGHT - 500, SCREEN_WIDTH, 500);
    self.chatView.backgroundColor = [UIColor redColor];
    self.chatView.delegate = self;
    [self.view addSubview:self.chatView];
    
    [self addMessage:MsgTypeIsText form:MsgFromIsLeft text:@"简单的聊天界面,低耦合,无依赖,修改简单"];
    [self addMessage:MsgTypeIsText form:MsgFromIsLeft text:@"1.0版本只有文字消息\n后续会加入输入框自适应高度,图片消息,语音消息,等等"];
}

- (void)sendMessage:(NSInteger)type text:(NSString *)text {
    [self addMessage:MsgTypeIsText form:MsgFromIsRight text:text];
}

- (void)addMessage:(NSInteger)type form:(NSInteger)form text:(NSString *)text {

    WBChatModel *msgModel = [[WBChatModel alloc] init];
    msgModel.msgType = type;
    msgModel.msgFrom = form;
    msgModel.msgText = text;
    [self.chatMsg addObject:msgModel];
    
    self.chatView.chatMsg = self.chatMsg;
}



@end
