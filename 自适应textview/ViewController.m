//
//  ViewController.m
//  自适应textview
//
//  Created by 张伟伟 on 2016/11/17.
//  Copyright © 2016年 张伟伟. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>

@property (strong, nonatomic) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.textView];
}

-(UITextView *)textView{
    if (!_textView) {
        _textView=[[UITextView alloc]initWithFrame:CGRectMake(30, 200, CGRectGetWidth([[UIScreen mainScreen] bounds])-60, 30)];
        [_textView setTextColor:[UIColor redColor]];
        [_textView.layer setBorderColor:[[UIColor blackColor] CGColor]];
        [_textView setFont:[UIFont systemFontOfSize:15]];
        [_textView.layer setBorderWidth:1.0f];
        [_textView setDelegate:self];
    }
    return _textView;
}

-(void)textViewDidChange:(UITextView *)textView{
    static CGFloat maxHeight =60.0f;
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    if (size.height<=frame.size.height) {
        size.height=frame.size.height;
    }else{
        if (size.height >= maxHeight)
        {
            size.height = maxHeight;
            textView.scrollEnabled = YES;   // 允许滚动
        }
        else
        {
            textView.scrollEnabled = NO;    // 不允许滚动
        }
    }
    textView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
