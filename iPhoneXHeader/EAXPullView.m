//
//  EAXPullView.m
//  iPhoneXHeader
//
//  Created by Ethan on 2017/12/18.
//  Copyright © 2017年 Ethan. All rights reserved.
//

#import "EAXPullView.h"

static CGFloat pullViewWidth = 400;
static CGFloat pullViewHeight = 210;

@interface EAXPullView ()

@property (nonatomic, strong) UIButton *showBtn;
@property (nonatomic, strong) UIView *pullBaseView;

@end

@implementation EAXPullView

- (id)initWithFrame:(CGRect)frame{
	
	if (self == [super initWithFrame:frame]) {
		[self setupPullView];
	}
	return self;
}

- (void)setupPullView{
	
	_pullBaseView = [[UIView alloc]initWithFrame:CGRectMake(-pullViewWidth + 22, (SCREEN_HEIGHT - pullViewHeight)/2, pullViewWidth, pullViewHeight)];
	_pullBaseView.backgroundColor = [UIColor blackColor];
	_pullBaseView.layer.cornerRadius = 22;
	_pullBaseView.clipsToBounds = YES;
	[self addSubview:_pullBaseView];
	
	CGFloat btnX = _pullBaseView.frame.origin.x + _pullBaseView.frame.size.width;
	_showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	_showBtn.frame = CGRectMake(btnX, SCREEN_HEIGHT/2 - 22, 44, 44);
	[_showBtn setImage:[UIImage imageNamed:@"show"] forState:UIControlStateNormal];
	[_showBtn addTarget:self action:@selector(showBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:_showBtn];
	
	[self bringSubviewToFront:_showBtn];
}

- (void)showBtnEvent:(UIButton *)sender{
	[sender setSelected:!sender.selected];
	sender.selected ? [self show] : [self hide];
}

- (void)show{
	
	[UIView animateWithDuration:1
						  delay:0
		 usingSpringWithDamping:0.8
		  initialSpringVelocity:0.7
						options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionTransitionFlipFromLeft
					 animations:^{
						 
						 _pullBaseView.frame = CGRectMake(-22, (SCREEN_HEIGHT - pullViewHeight)/2, pullViewWidth, pullViewHeight);
						 _showBtn.frame = CGRectMake(_pullBaseView.frame.origin.x + _pullBaseView.frame.size.width, SCREEN_HEIGHT/2 - 22, 44, 44);
						 _showBtn.transform = CGAffineTransformMakeRotation(180 *M_PI / 180.0);
						 
					 } completion:^(BOOL finished) {
		
	}];
	
}

- (void)hide{
	[UIView animateWithDuration:1
						  delay:0
		 usingSpringWithDamping:0.8
		  initialSpringVelocity:0.7
						options:UIViewAnimationOptionCurveEaseOut
					 animations:^{
						 
						 _pullBaseView.frame = CGRectMake(-pullViewWidth + 22, (SCREEN_HEIGHT - pullViewHeight)/2, pullViewWidth, pullViewHeight);
						 _showBtn.frame = CGRectMake(_pullBaseView.frame.origin.x + _pullBaseView.frame.size.width, SCREEN_HEIGHT/2 - 22, 44, 44);
						 _showBtn.transform = CGAffineTransformMakeRotation(0 *M_PI / 180.0);
						 
					 } completion:^(BOOL finished) {
						 
					 }];
}

@end
