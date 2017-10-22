
[![Build Status](https://travis-ci.org/exsortis/RoundButton.svg?branch=master)](https://travis-ci.org/exsortis/RoundButton)
![Version](https://cocoapod-badges.herokuapp.com/v/RoundButton/badge.png)
![Platform](https://cocoapod-badges.herokuapp.com/p/RoundButton/badge.png)
![License](https://cocoapod-badges.herokuapp.com/l/RoundButton/badge.png)

# RoundButton
A round, framed button with an image or text

## Usage

### Integration

#### CocoaPods

To use RoundButton with CocoaPods, add the following line to your `Podfile`:

```ruby
pod 'RoundButton'
```

#### Carthage

To use RoundButton with Carthage, add the following line to your `Cartfile`:

```carthage
github "exsortis/RoundButton"
```

### Button

Using the RoundButton is fairly simple. Just instantiate it in code, or set the custom class of a generic UIView to
"RoundButton". Set the image to be displayed in the button:

```objc
RoundButton* b = [RoundButton new];
b.image = theButtonImage;
```

Or, set text to be displayed instead:

```objc
b.text = @"5";
b.textFont = @"AvenirNext-Regular";
b.textColor = [UIColor greenColor];
```

If you need a badge displayed, set the badge properties:

```objc
b.showBadge = YES;
b.badge = 3;
b.badgeColor = [UIColor redColor];
```

## Copyright

Copyright © 2016-7 Pilgrimage Software

## License

See [LICENSE](LICENSE) for details.
