//
//  BookListCellView.m
//  LabLibrary
//
//  Created by Cloudox on 16/4/23.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "BookListCellView.h"

//设备的宽高
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height

@interface BookListCellView ()

@property (nonatomic, strong) UILabel *bookName;

@end

@implementation BookListCellView

- (instancetype)initWithFrame:(CGRect)frame andData:(NSArray *)data {
    self = [super initWithFrame:frame];
    if (self) {
        // 书籍图片
        UIImageView *bookImg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 15, 60, 66)];
        bookImg.image = [UIImage imageNamed:@"book_front_cover"];
        bookImg.layer.cornerRadius = 4.0;
        bookImg.layer.masksToBounds = YES;
        [self addSubview:bookImg];
        
        // 书籍名字
        _bookName = [[UILabel alloc] initWithFrame:CGRectMake(87, 15, SCREENWIDTH - 99, 20)];
        _bookName.text = [data objectAtIndex:0];
        _bookName.textAlignment = NSTextAlignmentLeft;
        _bookName.font = [UIFont systemFontOfSize:18];
        // 自动换行
        _bookName.numberOfLines = 0;
        _bookName.lineBreakMode = NSLineBreakByWordWrapping;
        CGSize nameSize = [_bookName sizeThatFits:CGSizeMake(SCREENWIDTH - 99, MAXFLOAT)];
        _bookName.frame = CGRectMake(87, 15, SCREENWIDTH - 99, nameSize.height);
        
        [self addSubview:_bookName];
        
        // 书籍ISBN
        UILabel *isbnLabel = [[UILabel alloc] initWithFrame:CGRectMake(87, _bookName.frame.origin.y + _bookName.frame.size.height + 10, SCREENWIDTH - 99, 20)];
        isbnLabel.text = [NSString stringWithFormat:@"ISBN：%@", [data objectAtIndex:1]];
        isbnLabel.textAlignment = NSTextAlignmentLeft;
        isbnLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:isbnLabel];
        
    }
    return self;
}

-(CGFloat)getHeight{
    return _bookName.frame.origin.y + _bookName.frame.size.height + 30 + 15 > 90 ? _bookName.frame.origin.y + _bookName.frame.size.height + 30 + 15 : 90;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
