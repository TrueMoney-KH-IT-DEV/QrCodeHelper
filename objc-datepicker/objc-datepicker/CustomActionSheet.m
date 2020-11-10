//
//  CustomActionSheet.m
//  objc-datepicker
//
//  Created by Samrith Yoeun on 11/9/20.
//

#import "CustomActionSheet.h"

@interface CustomActionSheet()

@property (nonatomic, strong) NSArray<NSString *> *dataSource;

@end

@implementation CustomActionSheet
- (UIAlertController *) createCustomActionSheetWithTitle:(NSString *)title {
    UIAlertController *controller = [[UIAlertController alloc]init];
    controller.title = title;
    controller.message = nil;
    [controller.view.heightAnchor constraintEqualToConstant: 400].active = YES;
    
    return controller;
}


- (void) showDatePickerInController:(UIViewController *)viewController
              selectedDateAction:(void(^)(NSDate* date))didSelectedDataAction {
    
    UIAlertController *controller = [self createCustomActionSheetWithTitle:@"DatePicker"];
    
    UIView *view = [[UIView alloc]init];
    [controller.view addSubview: view];
    
    CGFloat padding = 12;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view.leadingAnchor constraintEqualToAnchor:controller.view.leadingAnchor
                                       constant: padding].active = YES;
    [view.trailingAnchor constraintEqualToAnchor:controller.view.trailingAnchor
                                        constant:-1 * padding].active = YES;
    
    [view.topAnchor constraintEqualToAnchor:controller.view.topAnchor constant:25].active = YES;
    [view.heightAnchor constraintEqualToConstant:250].active = YES;
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [view addSubview:datePicker];
    datePicker.translatesAutoresizingMaskIntoConstraints = NO;
    [datePicker.leadingAnchor constraintEqualToAnchor:view.leadingAnchor].active = YES;
    [datePicker.trailingAnchor constraintEqualToAnchor:view.trailingAnchor].active = YES;
    [datePicker.topAnchor constraintEqualToAnchor:view.topAnchor].active = YES;
    [datePicker.heightAnchor constraintEqualToConstant:260].active = YES;
    datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    datePicker.clipsToBounds = YES;
    
    UIAlertAction *selectAction = [UIAlertAction actionWithTitle: @"Select"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
        didSelectedDataAction(datePicker.date);
    }];
    
    [controller addAction:selectAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [controller addAction:cancelAction];
    
    [viewController presentViewController:controller animated:YES completion:nil];
    
}

- (void) showPickerInController:(UIViewController *)viewController {
    
    UIAlertController *controller = [self createCustomActionSheetWithTitle:@"DatePicker"];
    
    UIView *view = [[UIView alloc]init];
    [controller.view addSubview: view];
    
    CGFloat padding = 12;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view.leadingAnchor constraintEqualToAnchor:controller.view.leadingAnchor
                                       constant: padding].active = YES;
    [view.trailingAnchor constraintEqualToAnchor:controller.view.trailingAnchor
                                        constant:-1 * padding].active = YES;
    
    [view.topAnchor constraintEqualToAnchor:controller.view.topAnchor constant:25].active = YES;
    [view.heightAnchor constraintEqualToConstant:250].active = YES;
    
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    [view addSubview:pickerView];
    pickerView.translatesAutoresizingMaskIntoConstraints = NO;
    [pickerView.leadingAnchor constraintEqualToAnchor:view.leadingAnchor].active = YES;
    [pickerView.trailingAnchor constraintEqualToAnchor:view.trailingAnchor].active = YES;
    [pickerView.topAnchor constraintEqualToAnchor:view.topAnchor].active = YES;
    [pickerView.heightAnchor constraintEqualToConstant:260].active = YES;
    pickerView.clipsToBounds = YES;
    
    pickerView.dataSource = self;
    
    UIAlertAction *selectAction = [UIAlertAction actionWithTitle: @"Select"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
    
    }];
    
    [controller addAction:selectAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [controller addAction:cancelAction];
    
    [viewController presentViewController:controller animated:YES completion:nil];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return
}

@end
