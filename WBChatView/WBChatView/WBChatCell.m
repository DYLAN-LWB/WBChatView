//
//  WBChatCell.m
//  WBChatView
//
//  Created by 李伟宾 on 2018/2/2.
//  Copyright © 2018年 李伟宾. All rights reserved.
//

#import "WBChatCell.h"

#define ICON_WH 40

@interface WBChatCell ()

@property (nonatomic, strong) UIImageView  *bubbleIV;   //气泡
@property (nonatomic, strong) UIImageView *iconIV;      //头像
@property (nonatomic, strong) UILabel *contentLabel;    //文字

@end

@implementation WBChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        UIView *backView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView = backView;
        self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    
    //头像
    self.iconIV = [[UIImageView alloc] init];
    self.iconIV.frame = CGRectMake(0, 0, ICON_WH, ICON_WH);
    self.iconIV.contentMode = UIViewContentModeScaleAspectFit;
    self.iconIV.image = [UIImage imageNamed:@"default_icon"];
    [self.contentView addSubview:self.iconIV];
    
    //背景气泡
    self.bubbleIV = [[UIImageView alloc] init];
    self.bubbleIV.userInteractionEnabled = YES;
    [self.contentView addSubview:self.bubbleIV];
    
    //消息内容
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:15];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.textColor = [UIColor grayColor];
    [self.bubbleIV addSubview:self.contentLabel];
}

- (void)setModel:(WBChatModel *)model {
    //计算文字长度
    self.contentLabel.text = model.msgText;
    CGSize labelSize = [model.msgText boundingRectWithSize: CGSizeMake(SCREEN_WIDTH-160, MAXFLOAT)
                                                      options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                                   attributes: @{NSFontAttributeName:self.contentLabel.font}
                                                      context: nil].size;
    self.contentLabel.frame = CGRectMake(model.msgFrom == MsgFromIsLeft ? 20 : 10 , 5, labelSize.width, labelSize.height + 10);
    
    //计算气泡位置
    CGFloat bubbleX = model.msgFrom == MsgFromIsLeft ? (ICON_WH + 25) : (SCREEN_WIDTH - ICON_WH - 25 - labelSize.width - 30);
    self.bubbleIV.frame = CGRectMake(bubbleX, 20, self.contentLabel.frame.size.width + 30, self.contentLabel.frame.size.height+10);
    
    //头像位置
    CGFloat iconX = model.msgFrom == MsgFromIsLeft ? 15 : (SCREEN_WIDTH - ICON_WH - 15);
    self.iconIV.frame = CGRectMake(iconX, 15, ICON_WH, ICON_WH);
    self.iconIV.image = [UIImage imageNamed: model.msgFrom  == MsgFromIsRight ? @"default_icon" : @"teacher_image"];

    //拉伸气泡
    UIImage *backImage = [UIImage imageNamed: model.msgFrom  == MsgFromIsLeft ? @"bubble_left" : @"bubble_right"];
    backImage = [backImage resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 10, 30) resizingMode:UIImageResizingModeStretch];
    self.bubbleIV.image = backImage;
}

@end
