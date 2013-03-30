//
//  LayerHostingView.m
//  LayerHostingBug
//
//  Created by Indragie Karunaratne on 2013-03-30.
//  Copyright (c) 2013 indragie. All rights reserved.
//

#import "LayerHostingView.h"

@implementation LayerHostingView

- (id)initWithFrame:(NSRect)frameRect
{
	if ((self = [super initWithFrame:frameRect])) {
		self.layer = [CALayer layer];
		self.wantsLayer = YES;
		CALayer *backgroundLayer = [CALayer layer];
		backgroundLayer.backgroundColor = [NSColor redColor].CGColor;
		backgroundLayer.frame = self.layer.bounds;
		backgroundLayer.autoresizingMask = kCALayerWidthSizable | kCALayerHeightSizable;
		[self.layer addSublayer:backgroundLayer];
	}
	return self;
}

@end
