//
//  AppDelegate.h
//  myPatttern
//
//  Created by HHC-MAC on 18/7/12.
//  Copyright © 2018年 HHC-MAC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSTextField *patternText;
@property (weak) IBOutlet NSTextField *stringText;
@property (unsafe_unretained) IBOutlet NSTextView *myTextView;

@end

