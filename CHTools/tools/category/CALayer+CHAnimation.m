//
//  CALayer+CHAnimation.m
//  test
//
//  Created by CHMac on 16/4/18.
//  Copyright © 2016年 CHMac. All rights reserved.
//

#import "CALayer+CHAnimation.h"
#import <objc/runtime.h>

#define kCHAnimationTime 1
#define CHEXPANDANIMATION @"expandAnimation"
#define CHSHRINKANIMATION @"shrinkAnimation"
#define CHSHAKEANIMATION  @"shakeAnimation"

typedef void(^AnimationCompleteBlock)();

@interface CALayer ()

@property (nonatomic, copy)AnimationCompleteBlock expandComp;
@property (nonatomic, copy)AnimationCompleteBlock shrinkComp;
@property (nonatomic, copy)AnimationCompleteBlock shakeComp;

@end

@implementation CALayer (CHAnimation)

-(void)expandAnimationComplete:(void (^)())completion{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @0;
    animation.toValue = @1;
    if (completion) {
        animation.delegate = self;
        self.expandComp = completion;
    }
    animation.duration = kCHAnimationTime;
    [self addAnimation:animation forKey:CHEXPANDANIMATION];
}

-(void)shrinkAnimationComplete:(void (^)())completion{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @1;
    animation.toValue = @0;
    if (completion) {
        animation.delegate = self;
        self.shrinkComp = completion;
    }
    animation.duration = kCHAnimationTime;
    [self addAnimation:animation forKey:CHSHRINKANIMATION];
}

-(void)shakeAnimationComplete:(void (^)())completion{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.values = @[@0,@(M_PI_2/9),@0,@(-M_PI_2/9),@0];
    animation.duration = kCHAnimationTime/20*animation.values.count;
    if (completion) {
        animation.delegate = self;
        self.shakeComp = completion;
    }
    [self addAnimation:animation forKey:CHSHAKEANIMATION];
}

#pragma mark - setter&&getter
-(void)setExpandComp:(AnimationCompleteBlock)expandComp{
    [self willChangeValueForKey:@"expandComp"];
    objc_setAssociatedObject(self, @"expandComp", expandComp, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"expandComp"];
}
-(AnimationCompleteBlock)expandComp{
    return objc_getAssociatedObject(self, @"expandComp");
}

-(void)setShakeComp:(AnimationCompleteBlock)shakeComp{
    [self willChangeValueForKey:@"shakeComp"];
    objc_setAssociatedObject(self, @"shakeComp", shakeComp, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"shakeComp"];
}
-(AnimationCompleteBlock)shakeComp{
    return objc_getAssociatedObject(self, @"shakeComp");
}

-(void)setShrinkComp:(AnimationCompleteBlock)shrinkComp{
    [self willChangeValueForKey:@"shrinkComp"];
    objc_setAssociatedObject(self, @"shrinkComp", shrinkComp, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"shrinkComp"];
}
-(AnimationCompleteBlock)shrinkComp{
    return objc_getAssociatedObject(self, @"shrinkComp");
}

#pragma mark - animationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (self.expandComp) {
        self.expandComp();
        self.expandComp = nil;
    }else if(self.shrinkComp){
        self.shrinkComp();
        self.expandComp = nil;
    }else if (self.shakeComp){
        self.shakeComp();
        self.shakeComp = nil;
    }
}

@end
