//
//  ViewController.h
//  Paint
//
//  Created by Makoto Mamiya on 2014/02/01.
//  Copyright (c) 2014年 KLOON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;
- (IBAction)pencilPressed:(id)sender;
- (IBAction)eraserPressed:(id)sender;
- (IBAction)reset:(id)sender;
- (IBAction)setting:(id)sender;
- (IBAction)save:(id)sender;

@end
