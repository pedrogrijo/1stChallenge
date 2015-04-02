//
//  ViewController.m
//  TouchTheNumbers
//
//  Created by Eduardo Carlassara on 3/25/15.
//  Copyright (c) 2015 Eduardo Carlassara. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIButton *buttonStart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   /* self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"startBackground.png"]];
    [self.backgroundImage setFrame: CGRectMake ( 0.0f, 0.0f, 375.0f, 680.0f)];
    [self.view addSubview: self.backgroundImage]; */
    
   /* self.buttonStart.layer.shadowColor = [UIColor blackColor].CGColor;
    self.buttonStart.layer.shadowOffset = CGSizeMake(15.0f,15.0f);
    self.buttonStart.layer.masksToBounds = NO;
    self.buttonStart.layer.shadowRadius = 5.0f;
    self.buttonStart.layer.shadowOpacity = 1.0;*/
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//commit test comments

@end
