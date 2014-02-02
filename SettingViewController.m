//
//  SettingViewController.m
//  Paint
//
//  Created by Makoto Mamiya on 2014/02/01.
//  Copyright (c) 2014年 KLOON. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
- (IBAction)closeSettings:(id)sender;

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

 //  ここから追加
@synthesize brush;
@synthesize opacity;
@synthesize delegate;
@synthesize red;
@synthesize green;
@synthesize blue;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    int redIntValue = self.red *255.0;
    self.redControl.value = redIntValue;
    [self sliderChanged:self.redControl];
    
    int greenIntValue = self.green * 255.0;
    self.greenControl.value = greenIntValue;
    [self sliderChanged:self.greenControl];
    
    int blueIntValue = self.blue *255.0;
    self.blueControl.value = blueIntValue;
    [self sliderChanged:self.blueControl];
    
    self.opacityControl.value = self.opacity;
    [self sliderChanged:self.opacityControl];
    
}

- (IBAction)closeSettings:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate closeSettings:self];
}

// スライダー
- (IBAction)sliderChanged:(id)sender {
    
    UISlider *changedSlider = (UISlider *)sender;
    
    
    if (changedSlider == self.brushControl) {
        
        self.brush = self.brushControl.value;
        self.brushValueLabel.text = [NSString stringWithFormat:@"%.1f",self.brush];
        
    } else if (changedSlider == self.opacityControl){
        
        self.opacity = self.opacityControl.value;
        self.opacityValueLabel.text = [NSString stringWithFormat:@"%.1f",self.opacity];
        
    } else if (changedSlider ==self.redControl) {
        
        self.red = self.redControl.value/255.0;
        self.redLabel.text = [NSString stringWithFormat:@"Red:%d",(int)self.redControl.value];
        
    } else if (changedSlider == self.greenControl){
      
        self.green = self.greenControl.value/255.0;
        self.greenLabel.text = [NSString stringWithFormat:@"Green:%d",(int)self.greenControl.value];
        
    } else if (changedSlider == self.blueControl){
        
        self.blue = self.blueControl.value/255.0;
        self.blueLabel.text = [NSString stringWithFormat:@"Blue:%d",(int)self.blueControl.value];
    }
    
    
        UIGraphicsBeginImageContext(self.brushPreview.frame.size);
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.red, self.green ,self.blue, 1.0); //書き換え
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 45, 45);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 45, 45);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.brushPreview.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
  /*  } else if (changedSlider == self.opacityControl) {
        
        self.opacity = self.opacityControl.value;
        self.opacityValueLabel.text = [NSString stringWithFormat:@"%.1f",self.opacity];
   
   */
        
        UIGraphicsBeginImageContext(self.opacityPreview.frame.size);
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(),self.brush); //書き換え
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.red, self.green, self.blue, self.opacity); //書き換え
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 45, 45);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 45, 45);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.opacityPreview.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
        


@end
