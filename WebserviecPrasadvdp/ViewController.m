//
//  ViewController.m
//  WebserviecPrasadvdp
//
//  Created by A on 09/04/17.
//  Copyright (c) 2017 mine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *jsonobj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GetContact];
}
-(void)GetContact{
    NSString *str=@"http://gojek-contacts-app.herokuapp.com/contacts.json";
    NSURL *url=[NSURL URLWithString:str];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    [request setHTTPBody:@"GET"];
    [request setValue:@"Application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *data=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *err;
        NSLog(@"block");
        self.jsonobj =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        NSLog(@"%@",self.jsonobj);
        
    }];
    [data resume];
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
