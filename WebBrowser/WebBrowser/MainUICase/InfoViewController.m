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

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *webViewHeight;	// MEMO: WebViewの高さを変更したい場合、このconstantプロパティに値を設定すればいい

@end

// インターフェースの実装
@implementation InfoViewController

S2_DEALLOC_LOGGING_IMPLEMENT

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
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
	// MEMO: Webロードエラー
	S2LogNSError(error);
}

@end
