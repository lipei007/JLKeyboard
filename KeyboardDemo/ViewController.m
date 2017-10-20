//
//  ViewController.m
//  KeyboardDemo
//
//  Created by Jack on 2017/4/27.
//  Copyright © 2017年 buakaw.lee.com.www. All rights reserved.
//

#import "ViewController.h"
#import "JLKeyboardListener.h"

@interface ViewController ()<JLKeyboardListenerDelegate>

@property (nonatomic,strong) JLKeyboardListener *keyboardListener;
@property (weak, nonatomic) IBOutlet UITextField *tf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.keyboardListener = [[JLKeyboardListener alloc] init];
    self.keyboardListener.delegate = self;
    [self.keyboardListener startListen];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touch)];
    [self.view addGestureRecognizer:tap];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)keyboardWillHideHeight:(CGFloat)height withDuration:(NSTimeInterval)duration {
//}
//
//- (void)keyboardWillShowHeight:(CGFloat)height withDuration:(NSTimeInterval)duration {
//    NSLog(@"show %lf",height);
//
//}
//
//- (void)keyboardWillChangeHeight:(CGFloat)height offset:(CGFloat)heightOffset withDuration:(NSTimeInterval)duration {
//    NSLog(@"change %lf",heightOffset);
//    
//    
//    for (NSLayoutConstraint *constraint in self.view.constraints) {
//        if ([constraint.identifier isEqualToString:@"constraint_h"]) {
//            
//            [UIView animateWithDuration:0.3 animations:^{
//                constraint.constant = self.view.bounds.size.height - heightOffset + 20;
//            }];
//            [self.view layoutIfNeeded];
//        }
//    }
//    
//   
//}

- (void)keyboardWillChangeOriginY:(CGFloat)y {
    
    for (NSLayoutConstraint *constraint in self.view.constraints) {
        if ([constraint.identifier isEqualToString:@"constraint_h"]) {
            
            [UIView animateWithDuration:0.3 animations:^{
                constraint.constant = self.view.bounds.size.height - y + 20;
            }];
            [self.view layoutIfNeeded];
        }
    }
}

- (void)touch {
    [self.view endEditing:YES];
}


@end
