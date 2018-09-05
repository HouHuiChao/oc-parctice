//
//  AppDelegate.m
//  myPatttern
//
//  Created by HHC-MAC on 18/7/12.
//  Copyright © 2018年 HHC-MAC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [_myTextView setEditable:NO];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    
    return YES;
}
- (IBAction)getPatternResult:(id)sender {
    _myTextView.string = @"";
    NSString *str = [_stringText stringValue];
    NSString *patternStr = [_patternText stringValue];
    NSRegularExpression *regExp=[NSRegularExpression regularExpressionWithPattern:patternStr options:NSRegularExpressionCaseInsensitive error:NULL];
    
    @try {
        NSArray *matches =[ regExp matchesInString:str options:0 range:NSMakeRange(0, str.length)];
        NSLog(@"%@",matches);
        for (NSTextCheckingResult *match in matches) {
            NSRange firstHalfRange = [match rangeAtIndex:1];
            NSString *results = [str substringWithRange:firstHalfRange];
            NSString *str = [NSString stringWithFormat:@"%@\n",results];
            [[_myTextView textStorage] appendAttributedString:[[NSAttributedString alloc] initWithString:str]];
            
            //[_myTextView scrollRangeToVisible:NSMakeRange(_myTextView.string.length , 1)];
        }
    }
    @catch (NSException *exception) {
        
        NSLog(@"<Exception> getStringWithPattern");
    }

}
@end
