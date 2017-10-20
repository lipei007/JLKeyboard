//
//  JLKeyboardListener.m
//  Keyboard
//
//  Created by Jack on 2017/4/11.
//  Copyright © 2017年 buakaw. All rights reserved.
//

#import "JLKeyboardListener.h"

@interface JLKeyboardListener ()

@property (nonatomic,assign) CGFloat keyboardHeight;
@property (nonatomic,assign) NSTimeInterval keyboardAnimationDuration;
@property (nonatomic,assign) BOOL showsKeyboard;

@end

@implementation JLKeyboardListener


- (instancetype)init {
    if (self = [super init]) {
        self.showsKeyboard = NO;
    }
    return self;
}

- (void)dealloc {
    [self stopListen];
}

- (void)startListen {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    // 键盘通知
    [notificationCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [notificationCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [notificationCenter addObserver:self selector:@selector(keyboardChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)stopListen {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self];
}


#pragma mark - keyboard Notification

/**键盘隐藏*/
- (void)keyboardWillHide:(NSNotification *)notification {
    
//    if (self.showsKeyboard) {
//        self.showsKeyboard = NO;
//
//        if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardWillHideHeight:withDuration:)]) {
//            [self.delegate keyboardWillHideHeight:self.keyboardHeight withDuration:self.keyboardAnimationDuration];
//        }
//    }
}

/**键盘显示*/
- (void)keyboardWillShow:(NSNotification *)notification {
    
//    NSTimeInterval duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
//    CGRect begin = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
//    CGRect end = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//
//    if (duration == 0) {
//        duration = 0.25;
//    }
//    self.keyboardAnimationDuration = duration;
//    if (!self.showsKeyboard) {
//        // 第三方键盘三次回调，仅执行最后一次(仅以搜狗输入法作的测试)
//        if (begin.size.height > 0 && begin.origin.y - end.origin.y > 0) {
//
//            self.showsKeyboard = YES;
//            self.keyboardHeight = end.size.height;
//            if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardWillShowHeight:withDuration:)]) {
//                [self.delegate keyboardWillShowHeight:self.keyboardHeight withDuration:self.keyboardAnimationDuration];
//            }
//
//        }
//    }
    
    
}

/**在使用过程中切换键盘*/
- (void)keyboardChangeFrame:(NSNotification *)notification {
    
    
    CGRect end = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    CGRect begin = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
//    // 在屏幕旋转时也会走这个方法，但是此时键盘会 hide -> show -> changeFrame
//    if (self.showsKeyboard) {
//
//        // 在ip6s中使用搜狗输入法和系统键盘切换时发现
//        // sougou --> sys : 282 -> 258
//        // sys --> sougou : 258 -> 0 -> 216 -> 282 也就是说系统键盘先下去隐藏，再弹出搜狗，在弹出搜狗的过程中在216处有回调
//
//        CGFloat offset = end.size.height - begin.size.height;
//        self.keyboardHeight = end.size.height;
//
//        if (offset != 0) {
//            NSTimeInterval changeFrameAnimationDuartion = 0.25;
//            if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardWillChangeHeight:offset:withDuration:)]) {
//                [self.delegate keyboardWillChangeHeight:self.keyboardHeight offset:offset withDuration:changeFrameAnimationDuartion];
//            }
//        }
//    } else {
//
//        // ios11 键盘通知改变。Show Keyboard调用
//        if (end.origin.y < begin.origin.y) {
//            self.showsKeyboard = YES;
//            CGFloat offset = end.size.height - begin.size.height;
//            self.keyboardHeight = end.size.height;
//            if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardWillChangeHeight:offset:withDuration:)]) {
//                [self.delegate keyboardWillChangeHeight:self.keyboardHeight offset:offset withDuration:self.keyboardAnimationDuration];
//            }
//        }
//
//    }
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(keyboardWillChangeOriginY:)]) {
        [self.delegate keyboardWillChangeOriginY:end.origin.y];
    }
}

#pragma mark - Getter

- (CGFloat)currentKeyboardHeight {
    return self.keyboardHeight;
}

@end

