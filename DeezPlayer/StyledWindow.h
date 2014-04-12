//
//  StyledWindow.h
//  DeezPlayer
//
//  Created by Bram Vandenbogaerde on 12/04/14.
//  Copyright (c) 2014 Imanel. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TitleView.h"


@interface StyledWindow : NSWindow{
    TitleView *titleview;
}
    -(void) setDeezerColors;
@end
