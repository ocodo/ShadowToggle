//
//  OCODOAppDelegate.h
//  ShadowToggle
//
//  Created by Jason Milkins on 14/06/2014.
//  Copyright (c) 2014 Ocodo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OCODOAppDelegate : NSObject {
    IBOutlet NSMenu *statusMenu;
    NSStatusItem * statusItem;
    NSImage *statusImage;
    NSImage *statusImageAlt;
}

- (IBAction)toggleShadows:(NSMenuItem *)sender;

@end
