/////////////////////////////////////////////////////
//
//  GLView.h
//  ofxCocoaWindow
//
//  Original code from,
//  http://developer.apple.com/library/mac/#samplecode/GLFullScreen/Introduction/Intro.html#//apple_ref/doc/uid/DTS40009820
//
//  Created by lukasz karluk on 16/11/11.
//  http://julapy.com/blog
//
/////////////////////////////////////////////////////

#pragma once

#include "ofMain.h"

#import <Cocoa/Cocoa.h>
#import <QuartzCore/CVDisplayLink.h>

@interface GLView : NSView {
	
	NSOpenGLContext *openGLContext;
	NSOpenGLPixelFormat *pixelFormat;
	
	CVDisplayLinkRef displayLink;
	BOOL isAnimating;
    
	float	timeNow;
    float   timeThen;
    float   fps;
    int		nFrameCount;
	double	lastFrameTime;
	float	frameRate;
    bool	bEnableSetupScreen;
}

@property (assign)   float timeNow;
@property (assign)   float timeThen;
@property (assign)   float fps;
@property (readonly) int nFrameCount;
@property (readonly) double lastFrameTime;
@property (readonly) float frameRate;
@property (assign)   bool bEnableSetupScreen;

- (id) initWithFrame:(NSRect)frameRect;
- (id) initWithFrame:(NSRect)frameRect shareContext:(NSOpenGLContext*)context;

- (NSOpenGLContext*) openGLContext;

- (void) drawView;

- (void) startAnimation;
- (void) stopAnimation;

@end
