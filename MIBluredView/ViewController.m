//
//  ViewController.m
//  BluredView
//
//  Created by Mustafa Ibrahim on 2/4/14.
//  Copyright (c) 2014 Mustafa Ibrahim. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MIBluredView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *showBarItem;
@property (strong, nonatomic) UIView *bluedView;
- (IBAction)showAction:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if([[UIScreen mainScreen] bounds].size.height == 568) {
        [((UIImageView *)[self.view viewWithTag:1]) setImage:[UIImage imageNamed:@"springboard_5"]];
    } else {
        [((UIImageView *)[self.view viewWithTag:1]) setImage:[UIImage imageNamed:@"springboard_4"]];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.bluedView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, self.view.frame.size.height)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    [self.bluedView addSubview:imageView];
    
    
    UIImage *image = [UIView blurredSnapshot:self.view withImageRect:self.view.frame withEffect:LightEffect];
    
    // get a snapshot with blur effect
    // change rect to capture a specific rect of view for example (bottom part)
    //    UIImage *image = [UIView blurredSnapshot:self.view withImageRect:CGRectMake(0, self.view.frame.size.height - 200, 320, 300) withEffect:LightEffect];
    [imageView setImage:image];
    [self.view addSubview:self.bluedView];
}

- (IBAction)showAction:(id)sender {
    
    if([[self.showBarItem title] isEqualToString:@"Show"]) {
        [UIView animateWithDuration:0.4 animations:^{
            self.bluedView.frame = CGRectMake(0, 0, self.bluedView.frame.size.width, self.bluedView.frame.size.height);
            
        }];
        [self.showBarItem setTitle:@"Dismiss"];
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            self.bluedView.frame = CGRectMake(0, self.view.frame.size.height, self.bluedView.frame.size.width, self.bluedView.frame.size.height);
        }];
        [self.showBarItem setTitle:@"Show"];
    }
    
    
}

@end
