//
//  ViewController.m
//  FaceID
//
//  Created by 王磊 on 2018/4/5.
//  Copyright © 2018年 wangleiTT. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@property (nonatomic, strong) LAContext *context;

@end

@implementation ViewController

- (LAContext *)context {
    if (_context == nil) {
        _context = [LAContext new];
    }
    return _context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginBtn setTitle:@"Login by FaceID😀" forState:UIControlStateNormal];
    [loginBtn sizeToFit];
    loginBtn.center = self.view.center;
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)loginBtnClick {
    
    NSError *error;
    
    BOOL canAuthentication = [self.context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error];
    
    if (canAuthentication) {
        
        [self.context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"验证FaceID" reply:^(BOOL success, NSError * _Nullable error) {
            
            //注意iOS 11.3之后需要配置Info.plist权限才可以通过Face ID验证哦!不然只能输密码啦...
            if (success) {
                UIAlertController *alearC = [UIAlertController alertControllerWithTitle:@"Success" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [alearC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }]];
                [self presentViewController:alearC animated:YES completion:nil];
                
            } else {
                NSLog(@"%@",error);
            }
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
