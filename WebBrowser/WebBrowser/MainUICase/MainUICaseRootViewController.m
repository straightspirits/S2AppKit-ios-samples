//
//  MainUICaseRootViewController.m
//  WebBrowser
//
//  Created by Fumio Furukawa on 2013/12/22.
//  Copyright (c) 2013年 Straight Spirits Inc. All rights reserved.
//

#import "MainUICase.h"



// プライベートインターフェースの定義
@interface MainUICaseRootViewController ()

@property (weak) S2NavigationController* mainViewController;
@property (weak) WebBrowseViewController* webBrowseViewController;

@end

// インターフェースの実装
@implementation MainUICaseRootViewController

S2_DEALLOC_LOGGING_IMPLEMENT

#pragma mark - View Lifecycle

- (void)viewDidLoad;
{
	[super viewDidLoad];

	_webBrowseViewController = [(MainUICase*)self.uicase loadViewController:[WebBrowseViewController identifier]];

	_mainViewController = [(MainUICase*)self.uicase wrapNavigationController:_webBrowseViewController];

	[self.view addSubview:_mainViewController.view];
	[self addChildViewController:_mainViewController];
}

@end
