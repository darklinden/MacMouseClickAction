//
//  AppDelegate.m
//  DemoForClick
//
//  Created by DarkLinden on 9/27/12.
//  Copyright (c) 2012 comcsoft. All rights reserved.
//

#import "AppDelegate.h"

#define KEY_px      @"KEY_px"
#define KEY_py      @"KEY_py"
#define KEY_count   @"KEY_count"

@implementation AppDelegate
@synthesize pTf_x;
@synthesize pTf_y;
@synthesize pTf_count;

- (void)click:(CGPoint)point
{
    CGEventRef mousedown = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseDown, point, kCGMouseButtonLeft);
    CGEventPost(kCGHIDEventTap, mousedown);
    
    CGEventRef mouseup = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseUp, point, kCGMouseButtonLeft);
    CGEventPost(kCGHIDEventTap, mouseup);
}

- (void)multiclick:(NSDictionary *)click
{
    NSUInteger x = [[click objectForKey:KEY_px] integerValue];
    NSUInteger y = [[click objectForKey:KEY_py] integerValue];
    
    CGPoint point;
    point.x = x;
    point.y = y;
    [self click:point];
    
    NSUInteger count = [[click objectForKey:KEY_count] integerValue];

    if (count > 0) {
        count--;
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSString stringWithFormat:@"%lu", x], KEY_px,
                              [NSString stringWithFormat:@"%lu", y], KEY_py,
                              [NSString stringWithFormat:@"%lu", count], KEY_count, nil];
        
        [self performSelector:@selector(multiclick:) withObject:dict afterDelay:0.008f];
    }
}

- (void)pBtn_testClick:(id)sender
{
    NSLog(@"%ld %ld %ld", pTf_x.integerValue, pTf_y.integerValue, pTf_count.integerValue);
    
    NSUInteger x = pTf_x.integerValue;
    NSUInteger y = pTf_y.integerValue;

    CGPoint point;
    point.x = x;
    point.y = y;
    
    [self click:point];
}

- (void)pBtn_fireClick:(id)sender
{
    NSLog(@"%ld %ld %ld", pTf_x.integerValue, pTf_y.integerValue, pTf_count.integerValue);
    
    NSUInteger count = pTf_count.integerValue;
    
    if (count > 100000) {
        count = 100000;
    }
    
    NSString *x = pTf_x.stringValue;
    NSString *y = pTf_y.stringValue;
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          x, KEY_px,
                          y, KEY_py,
                          [NSString stringWithFormat:@"%lu", count], KEY_count, nil];
    
    [self performSelector:@selector(multiclick:) withObject:dict afterDelay:2.f];
}

@end
