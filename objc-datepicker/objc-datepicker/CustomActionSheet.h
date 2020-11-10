//
//  CustomActionSheet.h
//  objc-datepicker
//
//  Created by Samrith Yoeun on 11/9/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomActionSheet : NSObject <UIPickerViewDelegate, UIPickerViewDataSource>

+ (void) showDatePickerInController:(UIViewController *)viewController selectedDateAction:(void(^)(NSDate* date))didSelectedDataAction;
+ (UIAlertController *) createCustomActionSheetWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
