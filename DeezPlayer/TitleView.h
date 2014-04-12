//
//  TitleView.h
//  DeezPlayer
//
//  Created by Bram Vandenbogaerde on 12/04/14.
//  Copyright (c) 2014 Imanel. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TitleView : NSView{
    NSRect titlebarRect;
    NSString *previousTitle;
}
-(void) setTitle:(NSString *)aString window:(NSWindow *)window;

@end
