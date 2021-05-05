#import "AppDelegate.h"
#import "MediaVideoView.h"

@import AVFoundation;

@implementation AppDelegate {
	UIWindow *_window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions
{
	_window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
	_window.backgroundColor = [UIColor darkGrayColor];
	_window.rootViewController = [UIViewController new];
	[_window makeKeyAndVisible];
	


	// Audio typically cuts out around 1 minute on these:
	// (Ironically they are both political clips from MSNBC, but from different sources.)
	AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL URLWithString:@"https://video.twimg.com/amplify_video/1389367071088291843/vid/640x360/4hhlJ0xBOcX6tgT1.mp4?tag=14"]];
//	AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL URLWithString:@"https://video.twimg.com/amplify_video/1389684384232525827/vid/640x360/FiPymFGRQAEMgtai.mp4?tag=14"]];

	
	
	// These play without issue:
//	AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL URLWithString:@"https://video.twimg.com/amplify_video/1207153693877002241/vid/480x480/lxuBvsFsIXbOeVcq.mp4?tag=13"]];
//	AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL URLWithString:@"https://video.twimg.com/amplify_video/1389761693719334916/vid/640x360/qLPyKRqTrp-cOjPn.mp4?tag=14"]];

	
	
	
	MediaVideoView *view = [[MediaVideoView alloc] initWithAVAsset:asset];
	view.frame = _window.rootViewController.view.bounds;
	[_window.rootViewController.view addSubview:view];
	
	NSLog(@"Starting to play...");
	[view play];

	return YES;
}

@end
