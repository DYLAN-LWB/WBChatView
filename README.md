# WBChatView
简单的消息聊天界面,低耦合,无依赖,修改简单


    self.chatView = [[WBChatView alloc] init];
    self.chatView.frame = CGRectMake(0, SCREEN_HEIGHT - 500, SCREEN_WIDTH, 500);
    self.chatView.backgroundColor = [UIColor redColor];
    self.chatView.delegate = self;
    [self.view addSubview:self.chatView];
    
//delegate
- (void)sendMessage:(NSInteger)type text:(NSString *)text {
    [self addMessage:MsgTypeIsText form:MsgFromIsRight text:text];
}

//新增消息
- (void)addMessage:(NSInteger)type form:(NSInteger)form text:(NSString *)text {

    WBChatModel *msgModel = [[WBChatModel alloc] init];
    msgModel.msgType = type;
    msgModel.msgFrom = form;
    msgModel.msgText = text;
    [self.chatMsg addObject:msgModel];
    
    self.chatView.chatMsg = self.chatMsg;
}
