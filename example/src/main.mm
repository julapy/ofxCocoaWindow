
#include "ofMain.h"
#include "ofAppGlutWindow.h"
#include "ofxCocoaWindow.h"
#include "testApp.h"

//========================================================================
int main( )
{
    bool bUseCocoaWindow = true;
    
    if( bUseCocoaWindow )
    {
        ofxCocoaWindow cocoaWindow;
        ofSetupOpenGL( &cocoaWindow, 1024, 768, OF_WINDOW );
    }
    else
    {
        ofAppGlutWindow window;
        ofSetupOpenGL( &window, 1024, 768, OF_WINDOW );
    }
	ofRunApp( new testApp() );
}
