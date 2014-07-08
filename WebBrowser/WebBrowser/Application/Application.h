//
//  Application.h
//  WebBrowser
//
//  Created by Fumio Furukawa on 2013/12/22.
//  Copyright (c) 2013年 Straight Spirits Inc. All rights reserved.
//



@interface ApplicationModel : S2UIModel

@end



@interface ApplicationContainer : S2UICaseContainer

@property (readonly) ApplicationModel* model;

@end



@interface S2UICase (Application)

@property (readonly) ApplicationModel* applicationModel;

@end



typedef void (^S2ViewCloseBlock)(S2ViewController* viewController);
