

#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup() 
{
    ofBackground( 0, 0, 0 );
    ofEnableAlphaBlending();
    ofSetVerticalSync( ( bVSync = true ) );
    
    image.loadImage( "transparency.png" );
    imagePos.set( 0, 100 );
}

//--------------------------------------------------------------
void testApp::update()
{
	imagePos.x += 1;
    if( imagePos.x > ofGetWidth() - image.width )
        imagePos.x = 0;
}

//--------------------------------------------------------------
void testApp::draw()
{
    vector<ofColor> colors;
    colors.push_back( ofColor :: red );
    colors.push_back( ofColor :: green );
    colors.push_back( ofColor :: blue );
    colors.push_back( ofColor :: magenta );
    colors.push_back( ofColor :: yellow );
    colors.push_back( ofColor :: cyan );
    
    int w   = ofGetWidth();
    int h   = ofGetHeight();
    int dy  = h / colors.size();
    int x   = 0;
    int y   = 0;
    
    for( int i=0; i<colors.size(); i++ )
    {
        float p = i / (float)( colors.size() - 1 );
        
        ofSetColor( colors[ i ] );
        ofRect( x, y, w, dy );
        
        y += dy;
    }
    
    ofSetColor( 255 );
    image.draw( imagePos.x, imagePos.y );
	
	ofSetColor( 0 );
	ofDrawBitmapString( "press 'f' to toggle fullscreen ",  20, 30 );
    ofDrawBitmapString( "press 'v' to toggle vertical sync, currently " + ( bVSync ? string("on") : string("off") ),  20, 50 );
    ofDrawBitmapString( "fps = " + ofToString( ofGetFrameRate() ), 20, 70 );
}

void testApp :: exit ()
{
    //
}

//--------------------------------------------------------------
void testApp::keyPressed(int key)
{
    if( key == 'f' )
        ofToggleFullscreen();
    
    if( key == 'v' )
        ofSetVerticalSync( ( bVSync = !bVSync ) );
}

//--------------------------------------------------------------
void testApp::keyReleased(int key){ 
	
}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){

}