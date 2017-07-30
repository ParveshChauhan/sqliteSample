//
//  ViewController.h
//  SquliteSample
//
//  Created by Parvesh Chauhan on 30/07/17.
//  Copyright © 2017 Parvesh Chauhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *regNoTextField;
@property (weak, nonatomic) IBOutlet UITextField *departmentTextField;
@property (weak, nonatomic) IBOutlet UITextField *yearTextField;

- (IBAction)saveData:(id)sender;
- (IBAction)findData:(id)sender;

@end

