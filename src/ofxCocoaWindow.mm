/////////////////////////////////////////////////////
//
//  ofxCocoaWindow.mm
//  ofxCocoaWindow
//
//  Created by lukasz karluk on 16/11/11.
//  http://julapy.com/blog
//
/////////////////////////////////////////////////////

#include "ofxCocoaWindow.h"

#import <AppKit/AppKit.h>

//------------------------------------------------------------
ofxCocoaWindow :: ofxCocoaWindow()
{
	orientation	= OF_ORIENTATION_DEFAULT; // for now this goes here.
}

ofxCocoaWindow :: ~ofxCocoaWindow ()
{
    //
}

//------------------------------------------------------------
void ofxCocoaWindow :: setupOpenGL( int w, int h, int screenMode ) 
{
    if( screenMode == OF_GAME_MODE )
    {
        cout << "OF_GAME_MODE not supported in ofxCocoaWindow. Please use OF_WINDOW or OF_FULLSCREEN" << endl;
        return;
    }
    
    pool = [ NSAutoreleasePool new ];
    [ NSApplication sharedApplication ];
    
    // this creates the Window and OpenGLView in the MyDelegate initialization
    delegate = [ [ [ ofxCocoaDelegate alloc ] initWithWidth : w
                                                     height : h
                                                 windowMode : (ofWindowMode)screenMode ] autorelease ];

    [ NSApp setDelegate : delegate ];
}

//------------------------------------------------------------
void ofxCocoaWindow :: initializeWindow ()
{
	// no callbacks needed.
}

//------------------------------------------------------------
void ofxCocoaWindow :: runAppViaInfiniteLoop ( ofBaseApp * appPtr ) 
{
	ofAppPtr = appPtr;
	
	ofGetAppPtr()->mouseX = 0;
	ofGetAppPtr()->mouseY = 0;
	
	[NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
	[NSApp activateIgnoringOtherApps:YES];
	// This launches the NSapp functions in  MyDelegate
  	[NSApp run]; 
	
	[pool drain];
}

//------------------------------------------------------------
float ofxCocoaWindow :: getFrameRate()
{
	return [ [ NSApp delegate ] getFrameRate ];
}

//------------------------------------------------------------
double ofxCocoaWindow :: getLastFrameTime()
{
	return [ [ NSApp delegate ] getLastFrameTime ];
}

//------------------------------------------------------------
int ofxCocoaWindow :: getFrameNum()
{
	return [ [ NSApp delegate ] getFrameNum ];
}

//------------------------------------------------------------
void ofxCocoaWindow :: setWindowTitle( string title )
{
	// TODO.
}

//------------------------------------------------------------
ofPoint ofxCocoaWindow :: getWindowSize()
{
	return ofPoint( getWidth(), getHeight(), 0 );
}

//------------------------------------------------------------
ofPoint ofxCocoaWindow :: getWindowPosition()
{
	NSRect viewFrame    = [ [ NSApp delegate ] getViewFrame ];
	NSRect windowFrame  = [ [ NSApp delegate ] getWindowFrame ];
	NSRect screenRect   = [ [ NSApp delegate ] getScreenFrame ];
	return ofPoint( windowFrame.origin.x, screenRect.size.height-windowFrame.origin.y-viewFrame.size.height, 0 );
}

//------------------------------------------------------------
ofPoint ofxCocoaWindow :: getScreenSize()
{
	NSRect screenRect = [ [ NSApp delegate ] getScreenFrame ];
	return ofPoint( screenRect.size.width, screenRect.size.height, 0 );
}

//------------------------------------------------------------
int ofxCocoaWindow :: getWidth()
{
	if( orientation == OF_ORIENTATION_DEFAULT || orientation == OF_ORIENTATION_180 )
		return [ [ NSApp delegate ] getViewFrame ].size.width;
	return [ [ NSApp delegate ] getViewFrame ].size.height;
}

//------------------------------------------------------------
int ofxCocoaWindow :: getHeight()
{
	if( orientation == OF_ORIENTATION_DEFAULT || orientation == OF_ORIENTATION_180 )
		return [ [ NSApp delegate ] getViewFrame ].size.height;
	return [ [ NSApp delegate ] getViewFrame ].size.width;
}

//------------------------------------------------------------
void ofxCocoaWindow :: setOrientation( ofOrientation orientationIn )
{
	orientation = orientationIn;
}

//------------------------------------------------------------
ofOrientation ofxCocoaWindow :: getOrientation()
{
	return orientation;
}

//------------------------------------------------------------
void ofxCocoaWindow :: setWindowPosition( int x, int y ) 
{
//    if( [ [ NSApp delegate ] windowMode ] == OF_FULLSCREEN )
//        return; // only do this in OF_WINDOW mode.
    
	NSRect viewFrame  = [ [ NSApp delegate ] getViewFrame ];
	NSRect screenRect = [ [ NSApp delegate ] getScreenFrame ];
	
	NSPoint position = NSMakePoint( x, screenRect.size.height - viewFrame.size.height - y );
    [ [ NSApp delegate ] setWindowPosition : position ];
}

//------------------------------------------------------------
void ofxCocoaWindow :: setWindowShape( int w, int h )
{
//    if( [ [ NSApp delegate ] windowMode ] == OF_FULLSCREEN )
//        return; // only do this in OF_WINDOW mode.
    
    NSRect windowFrame  = [ [ NSApp delegate ] getWindowFrame ];
	NSRect viewFrame    = [ [ NSApp delegate ] getViewFrame ];
	NSRect screenRect   = [ [ NSApp delegate ] getScreenFrame ];
    
    int x, y, g;
    x = windowFrame.origin.x;
    y = screenRect.size.height - viewFrame.size.height - windowFrame.origin.y;
	
    NSRect resizedWindowFrame = NSZeroRect;
    resizedWindowFrame.origin = NSMakePoint( x, screenRect.size.height - h - y );
	resizedWindowFrame.size   = NSMakeSize( w, h );
	
	[ [ NSApp delegate ] setWindowShape : resizedWindowFrame ];
}

//------------------------------------------------------------
void ofxCocoaWindow :: hideCursor() 
{
	[ NSCursor hide ];
}

//------------------------------------------------------------
void ofxCocoaWindow :: showCursor() 
{
	[ NSCursor unhide ];
    cout <<  [[ NSApp delegate ] getFrameRate] << endl;
}

//------------------------------------------------------------
void ofxCocoaWindow :: test()
{
	cout <<  "bla"<< endl;
}

//------------------------------------------------------------
void ofxCocoaWindow :: setFrameRate ( float targetRate )
{
	NSLog( @"When using the Core Video Display Link, setting frame rate is not possible. Use setUpdateRate to set the update frequency to something different than the frame rate." );
}

//------------------------------------------------------------
int ofxCocoaWindow :: getWindowMode()
{
	return [ [ NSApp delegate ] windowMode ];
}

//------------------------------------------------------------
void ofxCocoaWindow :: toggleFullscreen() 
{
	if( [ [ NSApp delegate ] windowMode ] == OF_GAME_MODE )
        return;
	
	if( [ [ NSApp delegate ] windowMode ] == OF_WINDOW )
    {
		[ [ NSApp delegate ] goFullScreenOnAllDisplays ];
       // [ [ NSApp delegate ] goFullScreen:NSMakeRect(1, 900-300, 400, 300) ];
    }
    else if( [ [ NSApp delegate ] windowMode ] == OF_FULLSCREEN )
    {
		[ [ NSApp delegate ] goWindow ];
    }
}

//------------------------------------------------------------
void ofxCocoaWindow :: setFullscreen(bool fullscreen)
{
	if( [ [ NSApp delegate ] windowMode ] == OF_GAME_MODE )
        return;
	
    if( fullscreen && [ [ NSApp delegate ] windowMode ] != OF_FULLSCREEN )
    {
		[ [ NSApp delegate ] goFullScreenOnAllDisplays ];
    }
    else if( !fullscreen && [ [ NSApp delegate ] windowMode ] != OF_WINDOW )
    {
		[ [ NSApp delegate] goWindow ];
    }
}

//------------------------------------------------------------
void ofxCocoaWindow :: enableSetupScreen()
{
	[ [ NSApp delegate] enableSetupScreen ];
}

//------------------------------------------------------------
void ofxCocoaWindow :: disableSetupScreen()
{
	[ [ NSApp delegate] disableSetupScreen ];
}