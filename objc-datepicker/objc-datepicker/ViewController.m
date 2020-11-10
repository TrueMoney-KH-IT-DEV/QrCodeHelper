//
//  ViewController.m
//  objc-datepicker
//
//  Created by Samrith Yoeun on 11/9/20.
//

#import "ViewController.h"
#import "CustomActionSheet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 40)];
    [button setTitle:@"Show Actionsheet" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self
               action: @selector(buttonAction)
     forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void) buttonAction {
    [CustomActionSheet showDatePickerInController:self
                               selectedDateAction:^(NSDate * _Nonnull date) {
        NSLog(@"%@", date);
    }];
}


@end
