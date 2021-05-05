@import UIKit;

@class AVURLAsset;

@interface MediaVideoView : UIView
- (instancetype)initWithAVAsset:(AVURLAsset *)asset;
- (void)play;
@end
