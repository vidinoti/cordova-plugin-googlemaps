//
//  MyPluginScrollView.m
//  DevApp
//
//  Created by masashi on 9/22/14.
//
//

#import "MyPluginScrollView.h"

@implementation MyPluginScrollView

UIView *myView = nil;

-  (id)initWithFrame:(CGRect)aRect
{
  self = [super initWithFrame:aRect];
  self.debugView = [[MyPluginLayerDebugView alloc] initWithFrame:aRect];
  // Avoid the white bar that appears at the top of the map with iPhone iOS 11
  // See problem description here: https://github.com/mapsplugin/cordova-plugin-googlemaps/issues/1909
  if (@available(iOS 11, *)) {
    self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
  }
  return self;
}

- (void)attachView:(UIView *)view {
  myView = view;
  [self addSubview:view];
  [self addSubview:self.debugView];
}
- (void)dettachView {
  [myView removeFromSuperview];
  [self.debugView removeFromSuperview];
}
@end
