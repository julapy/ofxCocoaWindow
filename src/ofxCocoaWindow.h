/////////////////////////////////////////////////////
//
//  ofxCocoaWindow.h
//  ofxCocoaWindow
//
//  Created by lukasz karluk on 16/11/11.
//  http://julapy.com/blog
//
/////////////////////////////////////////////////////

#pragma once

#include "ofMain.h"
#include "ofAppBaseWindow.h"
#include "ofxCocoaDelegate.h"

class ofBaseApp;

class ofxCocoaWindow : public ofAppBaseWindow
{
public:
	 ofxCocoaWindow();
	~ofxCocoaWindow();

	void setupOpenGL(int w, int h, int screenMode);
	void initializeWindow();
	void runAppViaInfiniteLoop(ofBaseApp * appPtr);

	void hideCursor();
	void showCursor();

	void setFullscreen(bool fullScreen);
	void toggleFullscreen();

	void setWindowTitle(string title);
	void setWindowPosition(int x, int y);
	void setWindowShape(int w, int h);

	ofPoint		getWindowPosition();
	ofPoint		getWindowSize();
	ofPoint		getScreenSize();

	void			setOrientation(ofOrientation orientation);
	ofOrientation	getOrientation();
		
	int			getWidth();
	int			getHeight();	

	int			getWindowMode();

	int			getFrameNum();
	float		getFrameRate();
	double		getLastFrameTime();
	void		setFrameRate(float targetRate);

	void		enableSetupScreen();
	void		disableSetupScreen();
    
    void        test();
	
protected:
	ofOrientation       orientation;
	ofBaseApp           *ofAppPtr;
	
	ofxCocoaDelegate    *delegate;
	NSAutoreleasePool   *pool; //not sure if needed
};