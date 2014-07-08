//
//  ApplicationContainer.m
//  WebBrowser
//
//  Created by Fumio Furukawa on 2013/12/22.
//  Copyright (c) 2013年 Straight Spirits Inc. All rights reserved.
//

#import "Application.h"



@implementation ApplicationContainer

- (id)init;
{
	if (self = [super init]) {
		_model = [ApplicationModel new];
	}
	return self;
}

- (void)viewDidLoad;
{
	self.view.backgroundColor = S2ColorBrown;
}

@end



@implementation S2UICase (Application)

- (ApplicationModel *)applicationModel;
{
	return ((ApplicationContainer*)self.container).model;
}

@end
