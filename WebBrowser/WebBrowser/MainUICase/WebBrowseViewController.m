//
//  WebBrowseViewController.m
//  WebBrowser
//
//  Created by Fumio Furukawa on 2013/12/22.
//  Copyright (c) 2013年 Straight Spirits Inc. All rights reserved.
//

#import "MainUICase.h"



// プライベートインターフェースの定義
@interface WebBrowseViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *pagePrevButton;
@property (weak, nonatomic) IBOutlet UIButton *pageNextButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;

@end

// インターフェースの実装
@implementation WebBrowseViewController

S2_DEALLOC_LOGGING_IMPLEMENT

#pragma mark - View Lifecycle

- (void)viewDidLoad;
{
	[super viewDidLoad];

	// Storyboardの設定をチェックする
	S2AssertNonNil(_webView.delegate);
	
	// WebView: コンテンツをロードする
	NSURLRequest* request = [NSURLRequest requestWithURL:S2URL(@"https://github.com/straightspirits/S2AppKit-ios")];
	[_webView loadRequest:request];
}

#pragma mark - Actions

- (IBAction)pagePrevButtonPressed:(id)sender;
{
	[_webView goBack];
}

- (IBAction)pageNextButtonPressed:(id)sender;
{
	[_webView goForward];
}

- (IBAction)infoButtonPressed:(id)sender;
{
	S2LogPass(@"InfoView open");

	[(MainUICase*)self.uicase presentInfoViewController_base:self completion:^{
		S2LogPass(@"InfoView closeed");
	}];
}

#pragma mark - WebView delegate

- (void)webViewDidStartLoad:(UIWebView *)webView;
{
	S2LogPass(@"");

	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView;
{
	S2LogPass(@"");

	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
	// MEMO: Webロードエラー
	S2LogNSError(error);
}

#pragma mark - TableView and more delegation...

@end
