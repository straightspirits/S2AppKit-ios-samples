//
//  DebugUICase.m
//  WebBrowser
//
//  Created by Fumio Furukawa on 2013/12/22.
//  Copyright (c) 2013年 Straight Spirits Inc. All rights reserved.
//

#import "DebugUICase.h"



@implementation DebugUICase

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

@end
