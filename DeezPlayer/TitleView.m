//
//  TitleView.m
//  DeezPlayer
//
//  Created by Bram Vandenbogaerde on 12/04/14.
//  Copyright (c) 2014 Imanel. All rights reserved.
// This file creates a white title
//

#import "TitleView.h"
#import "StyledWindow.h"

@implementation TitleView

- (void)drawString:(NSString *)string inRect:(NSRect)rect {
    static NSDictionary *att = nil;
    if (!att) {
        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [style setLineBreakMode:NSLineBreakByTruncatingTail];
        [style setAlignment:NSCenterTextAlignment];
        att = [[NSDictionary alloc] initWithObjectsAndKeys: style, NSParagraphStyleAttributeName,[NSColor whiteColor], NSForegroundColorAttributeName,[NSFont fontWithName:@"Helvetica" size:12], NSFontAttributeName, nil];
    }
    
    NSRect titlebarRect = NSMakeRect(rect.origin.x+20, rect.origin.y-4, rect.size.width, rect.size.height);
    
    
    [string drawInRect:titlebarRect withAttributes:att];
}


- (void)drawRect:(NSRect)dirtyRect
{
    NSRect windowFrame = [NSWindow  frameRectForContentRect:[[[self window] contentView] bounds] styleMask:[[self window] styleMask]];
    NSRect contentBounds = [[[self window] contentView] bounds];
    
    titlebarRect = NSMakeRect(0, 0, self.bounds.size.width, windowFrame.size.height - contentBounds.size.height);
    titlebarRect.origin.y = self.bounds.size.height - titlebarRect.size.height;
    
    NSRect topHalf, bottomHalf;
    NSDivideRect(titlebarRect, &topHalf, &bottomHalf, floor(titlebarRect.size.height / 2.0), NSMaxYEdge);
    
    NSBezierPath * path = [NSBezierPath bezierPathWithRoundedRect:self.bounds xRadius:4.0 yRadius:4.0];
    [[NSBezierPath bezierPathWithRect:titlebarRect] addClip];
    
    
    
    NSGradient * gradient1 = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithDeviceWhite:0.200 alpha:1.000] endingColor:[NSColor colorWithDeviceWhite:0.200 alpha:1.000]];
    
    [path addClip];
    
    
    //    [[NSColor colorWithCalibratedWhite:0.00 alpha:1.0] set];
    //   [path fill];
    
    
    [gradient1 drawInRect:topHalf angle:270.0];
    [gradient1 drawInRect:bottomHalf angle:270.0];
    
    //[[NSColor blackColor] set];
    NSRectFill(NSMakeRect(0, -4, self.bounds.size.width, 1.0));
    
    if(previousTitle == nil){
    [self drawString:@"DeezPlayer" inRect:titlebarRect];
    }
    else{
        [self drawString:previousTitle inRect:titlebarRect];
    }
    
    
}
- (void)initWithTitle:(NSString *)aTitle{
    NSRect windowFrame = [NSWindow  frameRectForContentRect:[[[self window] contentView] bounds] styleMask:[[self window] styleMask]];
    NSRect contentBounds = [[[self window] contentView] bounds];
    
    titlebarRect = NSMakeRect(0, 0, self.bounds.size.width, windowFrame.size.height - contentBounds.size.height);
    titlebarRect.origin.y = self.bounds.size.height - titlebarRect.size.height;
    
    NSRect topHalf, bottomHalf;
    NSDivideRect(titlebarRect, &topHalf, &bottomHalf, floor(titlebarRect.size.height / 2.0), NSMaxYEdge);
    
    NSBezierPath * path = [NSBezierPath bezierPathWithRoundedRect:self.bounds xRadius:4.0 yRadius:4.0];
    [[NSBezierPath bezierPathWithRect:titlebarRect] addClip];
    
    
    
    NSGradient * gradient1 = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithDeviceWhite:0.200 alpha:1.000] endingColor:[NSColor colorWithDeviceWhite:0.200 alpha:1.000]];
    
    [path addClip];
    
    
    //    [[NSColor colorWithCalibratedWhite:0.00 alpha:1.0] set];
    //   [path fill];
    
    
    [gradient1 drawInRect:topHalf angle:270.0];
    [gradient1 drawInRect:bottomHalf angle:270.0];
    
    //[[NSColor blackColor] set];
    NSRectFill(NSMakeRect(0, -4, self.bounds.size.width, 1.0));
    
    
    [self drawString:aTitle inRect:titlebarRect];
}

-(void) setTitle:(NSString *)aString window:(StyledWindow*) window{
    // Draw the titlebar again with a title
    [self initWithTitle:aString];
    // Assign the previous title variable, so when our view reinitializes it won't change back to "DeezPlayer"
    previousTitle = aString;
}

@end
