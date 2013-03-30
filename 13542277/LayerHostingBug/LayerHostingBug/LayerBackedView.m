//
//  LayerBackedView.m
//  LayerHostingBug
//
//  Created by Indragie Karunaratne on 2013-03-30.
//  Copyright (c) 2013 indragie. All rights reserved.
//

#import "LayerBackedView.h"

@implementation LayerBackedView

- (id)initWithFrame:(NSRect)frameRect
{
	if ((self = [super initWithFrame:frameRect])) {
		self.wantsLayer = YES;
	}
	return self;
}

- (CALayer *)makeBackingLayer
{
	CALayer *backingLayer = [CALayer layer];
	backingLayer.backgroundColor = [NSColor blueColor].CGColor;
	return backingLayer;
}

@end
