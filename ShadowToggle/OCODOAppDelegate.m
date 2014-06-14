//
//  OCODOAppDelegate.m
//  ShadowToggle
//
//  Created by Jason Milkins on 14/06/2014.
//  Copyright (c) 2014 Ocodo. All rights reserved.
//


#include <stdio.h>

typedef enum _CGSDebugOptions {
    kCGSDebugOptionNone,
    kCGSDebugOptionNoShadows = 16384
} CGSDebugOptions;

extern void CGSGetDebugOptions(CGSDebugOptions *options);
extern void CGSSetDebugOptions(CGSDebugOptions options);

bool toggle_shadows() {
    CGSDebugOptions options;
    CGSGetDebugOptions(&options);
    options ^= kCGSDebugOptionNoShadows;
    CGSSetDebugOptions(options);
    return options == 0;
}

#import "OCODOAppDelegate.h"

@implementation OCODOAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

}

- (void)awakeFromNib{
    NSBundle *bundle = [NSBundle mainBundle];
    
    statusImage = [[NSImage alloc] initWithContentsOfFile: [bundle pathForResource: @"statusImage" ofType: @"png"]];
    statusImageAlt = [[NSImage alloc] initWithContentsOfFile: [bundle pathForResource: @"statusImageAlt" ofType: @"png"]];
    
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setMenu: statusMenu];
    [statusItem setImage: statusImage];
    [statusItem setAlternateImage: statusImageAlt];
    [statusItem setHighlightMode: YES];
}

- (IBAction)toggleShadows:(id)sender {
    bool shadow_on;
    shadow_on = toggle_shadows();
    NSLog(@"Shadows: %i", shadow_on);
    if(shadow_on){
        [statusItem setImage: statusImage];
    } else {
        [statusItem setImage: statusImageAlt];
    }
}

- (IBAction)quit:(id)sender {
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}

@end

