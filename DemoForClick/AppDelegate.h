//
//  AppDelegate.h
//  DemoForClick
//
//  Created by DarkLinden on 9/27/12.
//  Copyright (c) 2012 comcsoft. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextField     *pTf_x;
@property (assign) IBOutlet NSTextField     *pTf_y;
@property (assign) IBOutlet NSTextField     *pTf_count;
@property (assign) IBOutlet NSDatePicker    *pDatePicker;

@property (assign) IBOutlet NSButton    *pBtn_test;
@property (assign) IBOutlet NSButton    *pBtn_fire;

- (IBAction)pBtn_testClick:(id)sender;
- (IBAction)pBtn_fireClick:(id)sender;

@end
