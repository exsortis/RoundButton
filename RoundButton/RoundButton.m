//
//  RoundButton.m
//  RoundButton
//
//  Created by Paul Schifferer on 4/28/13.
//  Copyright (c) 2017 Pilgrimage Software. All rights reserved.
//

#import "RoundButton.h"

@import QuartzCore;


#define GRADIENT1_VALUE (0.96f)
#define GRADIENT2_VALUE (0.90f)
#define GRADIENT3_VALUE (0.93f)
#define GRADIENT_ALPHA (0.8f)

@implementation RoundButton {

@private
    CAGradientLayer* _gradientLayer;
    CALayer* _containerLayer;
    UIImageView* _imageView;
    UILabel* _textLabel;
    CATextLayer* _badgeLayer;
}

@dynamic image;

- (instancetype)init {
    self = [super init];
    if(self) {
        [self setup];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if(self) {
        [self setup];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self setup];
    }

    return self;
}

- (void)setup {

    self.layer.cornerRadius = 5;
    self.layer.opaque = NO;
    self.backgroundColor = [UIColor clearColor];

    // container layer
    _containerLayer = [CALayer layer];
    _containerLayer.opaque = NO;
    _containerLayer.shadowColor = (self.enabled ?
                                   [UIColor darkGrayColor].CGColor :
                                   [UIColor clearColor].CGColor
                                   );
    _containerLayer.shadowOpacity = 0.4f;
    _containerLayer.shadowRadius = 3;
    _containerLayer.shadowOffset = CGSizeMake(1, 2);
    _containerLayer.borderColor = (self.enabled ?
                                   [UIColor darkGrayColor].CGColor :
                                   [UIColor lightGrayColor].CGColor
                                   );
    _containerLayer.borderWidth = 1; // 2;
    _containerLayer.cornerRadius = 5;
    [self.layer addSublayer:_containerLayer];

    // gradient layer
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.cornerRadius = 5;
    _gradientLayer.colors = (@[
                               (id)[UIColor colorWithRed:GRADIENT1_VALUE
                                                   green:GRADIENT1_VALUE
                                                    blue:GRADIENT1_VALUE
                                                   alpha:GRADIENT_ALPHA].CGColor,
                               (id)[UIColor colorWithRed:GRADIENT2_VALUE
                                                   green:GRADIENT2_VALUE
                                                    blue:GRADIENT2_VALUE
                                                   alpha:GRADIENT_ALPHA].CGColor,
                               (id)[UIColor colorWithRed:GRADIENT3_VALUE
                                                   green:GRADIENT3_VALUE
                                                    blue:GRADIENT3_VALUE
                                                   alpha:GRADIENT_ALPHA].CGColor,
                               ]);
    _gradientLayer.locations = (@[
                                  @(0),
                                  @(0.05),
                                  @(1),
                                  ]);
    _gradientLayer.masksToBounds = YES;

    [_containerLayer addSublayer:_gradientLayer];

    _imageView = [UIImageView new];
    _imageView.backgroundColor = [UIColor clearColor];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    //    _imageView.layer.cornerRadius = 5;
    _imageView.layer.masksToBounds = YES;

    [_containerLayer addSublayer:_imageView.layer];

    _badgeLayer = [CATextLayer layer];
    _badgeLayer.opaque = NO;
    _badgeLayer.masksToBounds = YES;

    _textLabel = [UILabel new];
    _textLabel.backgroundColor = [UIColor clearColor];
    _textLabel.contentMode = UIViewContentModeCenter;
    _textLabel.textAlignment = NSTextAlignmentCenter;
}

- (BOOL)isOpaque {
    return NO;
}

- (void)layoutSubviews {

    CGFloat radius = roundf(self.frame.size.width / 2.0f);
    self.layer.cornerRadius = radius;
    _containerLayer.cornerRadius = radius;
    _gradientLayer.cornerRadius = radius;
    //    _blurView.layer.cornerRadius = radius;
    //    _blurView.blurRadius = radius;
    _imageView.layer.cornerRadius = radius;

    _gradientLayer.frame = self.bounds;
    //    _blurView.frame = self.bounds;
    _containerLayer.frame = self.bounds;
    _containerLayer.shadowPath = CGPathCreateWithEllipseInRect(self.bounds, NULL);
    CGRect imageFrame = CGRectInset(self.bounds, 2.0f, 2.0f);
    _imageView.frame = imageFrame;
    _imageView.layer.cornerRadius = roundf(imageFrame.size.width / 2.0f);

    if(_text) {
        _textLabel.text = _text;
        _textLabel.frame = imageFrame;
        _textLabel.layer.cornerRadius = roundf(imageFrame.size.width / 2.0f);

        CGFloat fontSize = self.frame.size.height - 6.0f;
        if(_textFontName) {
            _textLabel.font = [UIFont fontWithName:_textFontName size:fontSize];
        }
        else {
            _textLabel.font = [UIFont systemFontOfSize:fontSize];
        }

        if(_textColor) {
            _textLabel.textColor = _textColor;
        }
        else {
            _textLabel.textColor = [UIColor blackColor];
        }

        [self addSubview:_textLabel];
    }
    else {
        [_textLabel removeFromSuperview];
    }

    if(_showBadge) {
        NSString* text = [NSString stringWithFormat:@"%ld", (long)_badge];
        _badgeLayer.backgroundColor = _badgeColor.CGColor;
        CGFloat badgeSideLength = self.frame.size.width / 4.0f;
        CGFloat badgeX = self.frame.size.width - badgeSideLength - 5.0f;
        CGFloat badgeY = self.frame.size.width - badgeSideLength - 5.0f;
        _badgeLayer.frame = CGRectMake(badgeX, badgeY, badgeSideLength, badgeSideLength);
        _badgeLayer.cornerRadius = roundf(badgeSideLength / 2.0f);
        _badgeLayer.contents = text;

        [self.layer addSublayer:_badgeLayer];
    }
    else {
        [_badgeLayer removeFromSuperlayer];
    }
}

- (nullable UIImage *)image {
    return _imageView.image;
}

- (void)setImage:(nullable UIImage *)image {
    _imageView.image = image;
}

- (void)setBadge:(NSInteger)badge {
    _badge = badge;
    [self setNeedsLayout];
}

- (void)setShowBadge:(BOOL)showBadge {
    _showBadge = showBadge;
    [self setNeedsLayout];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];

    _containerLayer.shadowColor = (enabled ?
                                   [UIColor darkGrayColor].CGColor :
                                   [UIColor clearColor].CGColor
                                   );
    _containerLayer.borderColor = (enabled ?
                                   [UIColor grayColor].CGColor :
                                   [UIColor lightGrayColor].CGColor
                                   );
}

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event {

    // scale up
    [UIView animateWithDuration:0.2
                     animations:^{
                         CATransform3D scale = CATransform3DMakeScale(1.2, 1.2, 1);
                         self.layer.transform = scale;
                     }];

    [super touchesBegan:touches
              withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches
               withEvent:(UIEvent *)event {

    [UIView animateWithDuration:0.15
                     animations:^{
                         self.layer.transform = CATransform3DIdentity;
                     }];

    [super touchesCancelled:touches
                  withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event {

    [UIView animateWithDuration:0.15
                     animations:^{
                         self.layer.transform = CATransform3DIdentity;
                     }];

    [super touchesEnded:touches
              withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event {

    BOOL containsTouch = NO;
    for(UITouch* touch in touches) {
        CGPoint location = [touch locationInView:self];
        if(CGRectContainsPoint(self.bounds, location)) {
            containsTouch = YES;
            break;
        }
    }

    if(containsTouch) {
        [UIView animateWithDuration:0.2
                         animations:^{
                             CATransform3D scale = CATransform3DMakeScale(1.2, 1.2, 1);
                             self.layer.transform = scale;
                         }];
    }
    else {
        [UIView animateWithDuration:0.15
                         animations:^{
                             self.layer.transform = CATransform3DIdentity;
                         }];
    }

    [super touchesMoved:touches
              withEvent:event];
}

@end

