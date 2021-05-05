#import "MediaVideoView.h"

@import AVFoundation;

@implementation MediaVideoView {
	AVURLAsset *_videoAsset;
    AVQueuePlayer *_player;
	AVPlayerLooper *_looper;
    AVPlayerLayer *_playerLayer;
}

- (instancetype)initWithAVAsset:(AVURLAsset *)asset
{
    if ((self=[super init])) {
		_videoAsset = asset;
		
		_player = [AVQueuePlayer new];
		_looper = [AVPlayerLooper playerLooperWithPlayer:_player templateItem:[AVPlayerItem playerItemWithAsset:_videoAsset]];
		
		_playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
		_playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
		[self.layer addSublayer:_playerLayer];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _playerLayer.frame = self.layer.bounds;
}

- (void)play
{
	[_player play];
}

@end
