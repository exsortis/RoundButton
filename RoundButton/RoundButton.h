//
//  RoundButton.h
//  RoundButton
//
//  Created by Paul Schifferer on 4/28/13.
//  Copyright (c) 2017 Pilgrimage Software. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface RoundButton : UIControl

@property (nonatomic, nullable, retain) IBInspectable UIImage* image;
@property (nonatomic, nullable, copy) IBInspectable NSString* text;
@property (nonatomic, nullable, copy) IBInspectable UIColor* textColor;
@property (nonatomic, nullable, copy) IBInspectable NSString* textFontName;
@property (nonatomic, assign) IBInspectable BOOL showBadge;
@property (nonatomic, assign) IBInspectable NSInteger badge;
@property (nonatomic, nullable, retain) IBInspectable UIColor* badgeColor;

@end

