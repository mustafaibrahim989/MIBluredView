MIBluredView
============

iOS 7 Blur View Category

Installation
============

    UIImage *image = [UIView blurredSnapshot:self.view withImageRect:self.view.frame withEffect:LightEffect];
    
or change rect to capture a specific rect of view for example (bottom part)

    UIImage *image = [UIView blurredSnapshot:self.view withImageRect:CGRectMake(0, self.view.frame.size.height - 200, 320, 300) withEffect:LightEffect];
    
Choose between LightEffect, DarkEffect and ExtraLightEffect.
    
    
Notes
============

Designed for iOS 7.

Screenshots
============
![alt tag](https://raw.github.com/mustafaibrahim989/MIBluredView/master/Screenshots/1.png)    ![alt tag](https://raw.github.com/mustafaibrahim989/MIBluredView/master/Screenshots/2.png)


License
============
MIBluredView is available under the MIT license. See the LICENSE file for more info.
