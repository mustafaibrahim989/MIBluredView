//
//  UIView+MIBluredView.m
//  Mustafa Ibrahim
//
//  Created by Mustafa Ibrahim on 1/26/14.
//  Copyright (c) 2014 Mustafa Ibrahim. All rights reserved.
//

#import "UIView+MIBluredView.h"

@implementation UIView (MIBluredView)

+ (UIImage *)blurredSnapshot:(UIView *) view withImageRect:(CGRect)rect withEffect:(BlurEffect) effect
{
    // Create the image context
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, view.window.screen.scale);
    
    // There he is! The new API method
    [view drawViewHierarchyInRect:view.frame afterScreenUpdates:NO];
    
    // Get the snapshot
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Now apply the blur effect using Apple's UIImageEffect category
    UIImage *blurredSnapshotImage;
    switch (effect) {
        case 0:
            blurredSnapshotImage = [snapshotImage applyLightEffect];
            break;
            
        case 1:
            blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
            break;
        
        case 2:
            blurredSnapshotImage = [snapshotImage applyDarkEffect];
            break;
            
        default:
            break;
    }
    
    
    // Be nice and clean your mess up
    UIGraphicsEndImageContext();
    
    
    // crop image to specific rect
    UIGraphicsBeginImageContext(rect.size);
    [blurredSnapshotImage drawAtPoint:CGPointMake(-rect.origin.x, -rect.origin.y)];
    
    blurredSnapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return blurredSnapshotImage;
}

@end
