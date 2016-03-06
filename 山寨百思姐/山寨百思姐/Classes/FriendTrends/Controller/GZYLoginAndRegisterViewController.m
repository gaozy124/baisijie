//
//  GZYLoginAndRegisterViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/20.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYLoginAndRegisterViewController.h"


@interface GZYLoginAndRegisterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewLeadingMargin;

@end

@implementation GZYLoginAndRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)registerButtonClicked:(id)sender {
    
    [self.view endEditing:YES];
    
    if (self.loginViewLeadingMargin.constant == 0) {
        self.loginViewLeadingMargin.constant = -self.view.width;
//        [sender setSelected:YES];
        [sender setTitle:@"已有帐号?" forState:UIControlStateNormal];
    }else{
        self.loginViewLeadingMargin.constant = 0;
//        [sender setSelected:NO];
        [sender setTitle:@"注册帐号" forState:UIControlStateNormal];
        
    }
    

    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
        
    }];
    
    
    
}

- (IBAction)close:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

#pragma mark - <UITextFieldDelegate>


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}

@end
