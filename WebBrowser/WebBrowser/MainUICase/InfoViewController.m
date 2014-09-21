//
//  InfoViewController.m
//  WebBrowser
//
//  Created by Fumio Furukawa on 2013/12/22.
//  Copyright (c) 2013年 Straight Spirits Inc. All rights reserved.
//

#import "MainUICase.h"



// プライベートインターフェースの定義
@interface InfoViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidth;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *webViewHeight;	// MEMO: WebViewの高さを変更したい場合、このconstantプロパティに値を設定すればいい

@end

// インターフェースの実装
@implementation InfoViewController

S2_DEALLOC_LOGGING_IMPLEMENT

- (BOOL)shouldAutorotate;
{
	return YES;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad;
{
	[super viewDidLoad];

	// Storyboardの設定をチェックする
	S2AssertNonNil(_webView.delegate);
	
	// WebView: スクロールを不許可にする
	_webView.scrollView.scrollEnabled = NO;

	// WebView: コンテンツをロードする
	NSURLRequest* request = [NSURLRequest requestWithURL:S2URL(@"https://www.google.co.jp/search?q=%E4%BD%BF%E3%81%84%E6%96%B9&oq=%E4%BD%BF%E3%81%84%E6%96%B9&ie=UTF-8")];
	[_webView loadRequest:request];
}

- (void)viewWillLayoutSubviews;
{
	S2LogPass(@"%f", self.view.width);
	[super viewWillLayoutSubviews];

	_contentViewWidth.constant = UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation) ? self.view.width : self.view.height;
}

- (void)viewDidLayoutSubviews;
{
	[super viewDidLayoutSubviews];

	[_scrollView layoutIfNeeded];
	_scrollView.contentSize = _contentView.size;
}

#pragma mark - Actions

- (IBAction)closeButtonPressed:(id)sender;
{
	// WebView: 読み込みを中止する
	[_webView stopLoading];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

	if (_close)
		_close(self);
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

	int ar = _webView.scrollView.contentSize.height;
//	_webViewHeight.constant = _webView.scrollView.contentSize.height;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
	// MEMO: Webロードエラー
	S2LogNSError(error);
}

@end
