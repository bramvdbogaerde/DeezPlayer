//
//  StyledWindow.m
//  DeezPlayer
//
//  Created by Bram Vandenbogaerde on 12/04/14.
//  Copyright (c) 2014 Imanel. All rights reserved.
//

#import "StyledWindow.h"

@implementation StyledWindow
    -(void) setDeezerColors{
        NSRect boundsRect = [[[self contentView] superview] bounds];
        titleview = [[TitleView alloc] initWithFrame:boundsRect];
        [titleview setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable)];
        
        [[[self contentView] superview] addSubview:titleview positioned:NSWindowBelow relativeTo:[[[[self contentView] superview] subviews] objectAtIndex:0]];

    }
    -(void) setTitle:(NSString *)aString{
        [titleview setTitle:aString window:self];
    }
@end
