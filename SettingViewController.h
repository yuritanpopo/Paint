//
//  SettingViewController.h
//  Paint
//
//  Created by Makoto Mamiya on 2014/02/01.
//  Copyright (c) 2014年 KLOON. All rights reserved.
//

#import <UIKit/UIKit.h>
 //ここから追加
@protocol SettingViewControllerDelegate
- (void)closeSettings:(id)sender;
@end

@interface SettingViewController : UIViewController

 //追加
@property (nonatomic,weak)id delegate;

@property CGFloat red;
@property CGFloat green;
@property CGFloat blue;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeSettings;
@property (weak, nonatomic) IBOutlet UISlider *brushControl;
@property (weak, nonatomic) IBOutlet UISlider *opacityControl;
@property (weak, nonatomic) IBOutlet UIImageView *brushPreview;
@property (weak, nonatomic) IBOutlet UIImageView *opacityPreview;
@property (weak, nonatomic) IBOutlet UILabel *brushValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *opacityValueLabel;

@property CGFloat brush;
@property CGFloat opacity;

@property (weak, nonatomic) IBOutlet UISlider *redControl;
@property (weak, nonatomic) IBOutlet UISlider *greenControl;
@property (weak, nonatomic) IBOutlet UISlider *blueControl;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;

- (IBAction)sliderChanged:(id)sender;

@end
