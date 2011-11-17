/////////////////////////////////////////////////////
//
//  ofxCocoaDelegate.h
//  ofxCocoaWindow
//
//  Created by lukasz karluk on 16/11/11.
//  http://julapy.com/blog
//
/////////////////////////////////////////////////////

#pragma once

#import "GLView.h"

@interface ofxCocoaDelegate : NSObject 
{
    NSWindow        *openGLWindow;
    GLView          *openGLView;

	NSWindow        *fullScreenWindow;
	GLView          *fullScreenView;
    
    ofWindowMode    windowMode;
}

@property (retain) NSWindow *openGLWindow;
@property (retain) GLView   *openGLView;
@property (retain) NSWindow *fullScreenWindow;
@property (retain) GLView   *fullScreenView;
@property (assign) ofWindowMode windowMode;

- (id)initWithWidth : (int)width 
             height : (int)height 
         windowMode : (ofWindowMode)windowMode;

- (void) goFullScreenOnAllDisplays;
- (void) goFullScreenOnDisplay : (int)displayIndex;
- (void) goFullScreen : (NSRect)displayRect;
- (void) goWindow;

- (float) getFrameRate;
- (double) getLastFrameTime;
- (int) getFrameNum;
- (NSRect) getViewFrame;
- (NSRect) getWindowFrame;
- (NSRect) getScreenFrame;
- (void) setWindowPosition : (NSPoint)position;
- (void) setWindowShape : (NSRect)shape;
- (void) enableSetupScreen;
- (void) disableSetupScreen;

@end
