# Face-ID
A simple FaceID program demo.一个简单的FaceID程序demo.
//core code
- (IBAction)loginByFaceID:(UIButton *)sender {
    
    NSError *error;
    
    BOOL canAuthentication = [self.context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error];
    
    if (canAuthentication) {
        
        [self.context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"验证FaceID" reply:^(BOOL success, NSError * _Nullable error) {
            
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
