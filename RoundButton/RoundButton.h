//
//  RoundButton.h
//  RoundButton
//
//  Created by Paul Schifferer on 4/28/13.
//  Copyright (c) 2017 Pilgrimage Software. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 A circular button with a drop shadow that takes an image or text, and optionally displays a badge.
 */
IB_DESIGNABLE
@interface RoundButton : UIControl

/**
 The image to set into the frame of the button. May be null.
 */
@property (nonatomic, nullable, retain) IBInspectable UIImage* image;
/**
 The text label to set into the frame of the button. May be null.

 If this is set, the image property will be ignored.
 */
@property (nonatomic, nullable, copy) IBInspectable NSString* text;
/**
 The color of the text label.
 */
@property (nonatomic, nullable, copy) IBInspectable UIColor* textColor;
/**
 The font of the text label. If a font for this name cannot be instantiated, then a system font will be used.
 */
@property (nonatomic, nullable, copy) IBInspectable NSString* textFontName;
/**
 Indicates whether a badge should be displayed over the lower-right edge of the button.
 */
@property (nonatomic, assign) IBInspectable BOOL showBadge;
/**
 The numeric value to display in the badge, if it is shown.
 */
@property (nonatomic, assign) IBInspectable NSInteger badge;
/**
 The color of the badge, if it is shown.
 */
@property (nonatomic, nullable, retain) IBInspectable UIColor* badgeColor;

@end

