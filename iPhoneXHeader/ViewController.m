//
//  ViewController.m
//  iPhoneXHeader
//
//  Created by Ethan on 2017/12/18.
//  Copyright © 2017年 Ethan. All rights reserved.
//

#import "ViewController.h"
#import "EAXPullView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	EAXPullView *view = [[EAXPullView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
	[self.view addSubview:view];
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
