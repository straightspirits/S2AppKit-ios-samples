//
//  MainUICase.h
//  WebBrowser
//
//  Created by Fumio Furukawa on 2013/12/22.
//  Copyright (c) 2013年 Straight Spirits Inc. All rights reserved.
//

#import "Application.h"



/*
 *	MainUICase:
 *		UIケースにはビューの生成と表示（present）ロジックを収めます。
 */
@interface MainUICase : S2UICase

- (S2NavigationController*)wrapNavigationController:(S2ViewController*)rootViewController;
- (void)presentInfoViewController_base:(S2ViewController*)base completion:(void(^)())completion;

@end



@interface MainUICaseRootViewController : S2ViewController

@end



@interface WebBrowseViewController : S2ViewController

@end



@interface InfoViewController : S2ViewController

@property (copy) S2ViewCloseBlock close;

@end
