//
//  MainUICase.m
//  WebBrowser
//
//  Created by Fumio Furukawa on 2013/12/22.
//  Copyright (c) 2013年 Straight Spirits Inc. All rights reserved.
//

#import "MainUICase.h"



@implementation MainUICase

// ストーリーボード名
- (NSString*)storyboardName;
{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		return self.name;
	}
	else {
		return self.name;
	}
}

#pragma mark - View Controllers

- (S2NavigationController*)wrapNavigationController:(S2ViewController*)rootViewController;
{
	S2NavigationController* nc = [S2NavigationController new_rootViewController:rootViewController];

	// NavigationController: 設定
	nc.navigationBar.translucent = NO;	// MEMO: StoryboardのViewControllerの[Simulated Metrics/Top Bar]の設定をこれに合わせること

	return nc;
}

- (void)presentInfoViewController_base:(S2ViewController*)base completion:(void(^)())completion;
{
	// ViewControllerを生成する
	InfoViewController* vc = [self loadViewController:[InfoViewController identifier]];

	// ViewController引数を設定する。
	// MEMO: vc.viewにアクセスする前に設定すること。
	
	// ViewControllerを表示する
	// MEMO: モーダル表示をしている。
//	vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
	[base presentViewController:vc animated:YES completion:nil];

	// closeブロックを設定する
	// MEMO: presentViewController:animated:completion は非同期呼び出しなので、すぐここに到達する。
	// MEMO: コードの見やすさのため、実行されるコードの時系列で配置している。（表示→非表示）
	vc.close = ^(S2ViewController* viewController) {
		// Viewを閉じる
		[viewController dismissViewControllerAnimated:YES completion:nil];

		// 呼び出し元の完了コールバックを呼び出す
		if (completion)
			completion();
	};
}

@end
