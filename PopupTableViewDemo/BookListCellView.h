//
//  BookListCellView.h
//  LabLibrary
//
//  Created by Cloudox on 16/4/23.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookListCellView : UITableViewCell

- (instancetype)initWithFrame:(CGRect)frame andData:(NSArray *)data;

- (CGFloat)getHeight;

@end
