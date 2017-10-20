//
//  JLKeyboardListener.h
//  Keyboard
//
//  Created by Jack on 2017/4/11.
//  Copyright © 2017年 buakaw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JLKeyboardListenerDelegate <NSObject>

@optional
- (void)keyboardWillShowHeight:(CGFloat)height withDuration:(NSTimeInterval)duration;

- (void)keyboardWillHideHeight:(CGFloat)height withDuration:(NSTimeInterval)duration;

/**
 键盘高度发生改变
 
 @param height 新的键盘高度
 @param heightOffset 发生改变偏移量，大于0表示高度增加
 @param duration 动画持续时间
 */
- (void)keyboardWillChangeHeight:(CGFloat)height offset:(CGFloat)heightOffset withDuration:(NSTimeInterval)duration;

@required
- (void)keyboardWillChangeOriginY:(CGFloat)y;

@end

@interface JLKeyboardListener : NSObject

@property (nonatomic,weak) id<JLKeyboardListenerDelegate> delegate;

@property (nonatomic,assign,readonly) CGFloat currentKeyboardHeight;

- (void)startListen;

- (void)stopListen;

@end

