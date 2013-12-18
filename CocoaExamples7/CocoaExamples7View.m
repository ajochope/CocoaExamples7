//
//  CocoaExamples7View.m
//  CocoaExamples7
//
//  Created by Oscar Calles on 12/17/13.
//  Copyright (c) 2013 ocalles@gmail.com. All rights reserved.
//

#import "CocoaExamples7View.h"

@implementation CocoaExamples7View

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        _rect = NSMakeRect(0, 0, frame.size.width/10, frame.size.height/10);
        _rectMovement = NSMakePoint(10, 10);
        
        /*
        kView = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, _rect.size.width, _rect.size.height)];
        [kView setImageScaling:NSImageScaleProportionallyUpOrDown];
        [kView setImage:[NSImage imageNamed:@"turtle.png"]];
        [self addSubview:kView];
        
        NSRect kRect = kView.frame;
        NSBitmapImageRep* kRep = [kView bitmapImageRepForCachingDisplayInRect:kRect];
        [kView cacheDisplayInRect:kRect toBitmapImageRep:kRep];
       */
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    [[NSColor whiteColor] set];
    NSRectFill(_rect);
    if(_rect.origin.x > rect.size.width - _rect.size.width)
        _rectMovement.x = -_rectMovement.x;
    if(_rect.origin.x < rect.origin.x)
        _rectMovement.x = -_rectMovement.x;
    if(_rect.origin.y > rect.size.height - _rect.size.height)
        _rectMovement.y = -_rectMovement.y;
    if(_rect.origin.y < rect.origin.y)
        _rectMovement.y = -_rectMovement.y;
    _rect.origin.x += _rectMovement.x;
    _rect.origin.y += _rectMovement.y;
    [[NSColor blueColor]set];
    NSRectFill(_rect);
 
}

- (void)animateOneFrame
{
    [self setNeedsDisplay:YES];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
