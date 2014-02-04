//
//  UIView+MIBluredView.h
//  Mustafa Ibrahim
//
//  Created by Mustafa Ibrahim on 1/26/14.
//  Copyright (c) 2014 Mustafa Ibrahim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+ImageEffects.h"

typedef enum {
    LightEffect = 0,
    ExtraLightEffect,
    DarkEffect,
    Custom
} BlurEffect;

@interface UIView (MIBluredView)

+ (UIImage *)blurredSnapshot:(UIView *) view withImageRect:(CGRect)rect withEffect:(BlurEffect) effect;

@end
