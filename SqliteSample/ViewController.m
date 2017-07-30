//
//  ViewController.m
//  SquliteSample
//
//  Created by Parvesh Chauhan on 30/07/17.
//  Copyright © 2017 Parvesh Chauhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)saveData:(id)sender{
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (self.regNoTextField.text.length>0 &&self.nameTextField.text.length>0 &&
        self.departmentTextField.text.length>0 &&self.yearTextField.text.length>0 )
    {
        success = [[DBManager getSharedInstance]saveData:
                   self.regNoTextField.text name:self.nameTextField.text department:
                   self.departmentTextField.text year:self.yearTextField.text];
    }
    else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              alertString message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Data is saved" message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];

    }
}

-(IBAction)findData:(id)sender{
    NSArray *data = [[DBManager getSharedInstance]findByRegisterNumber:
                     self.regNoTextField.text];
    if (data == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Data not found" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        self.regNoTextField.text = @"";
        self.nameTextField.text =@"";
        self.departmentTextField.text = @"";
        self.yearTextField.text =@"";
    }
    else{
        self.regNoTextField.text = self.regNoTextField.text;
        self.nameTextField.text =[data objectAtIndex:0];
        self.departmentTextField.text = [data objectAtIndex:1];
        self.yearTextField.text =[data objectAtIndex:2];
    }
}

#pragma mark - Text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{

}
-(void)textFieldDidEndEditing:(UITextField *)textField{

    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


@end
