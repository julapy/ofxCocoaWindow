
#include "ofMain.h"
#include "ofApp.h"

#include "ofxCocoaWindow.h"

//========================================================================
int main( )
{
    ofxCocoaWindow cocoaWindow;
    ofSetupOpenGL(&cocoaWindow, 800, 600, OF_WINDOW);
	ofRunApp(new ofApp());
}
