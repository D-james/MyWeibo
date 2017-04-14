//
//  DSTabBarController.m
//  MyWeibo
//
//  Created by cuctv-duan on 17/4/14.
//  Copyright © 2017年 duan. All rights reserved.
//

#import "DSTabBarController.h"
#import "DSNavigationController.h"
#import "DSHomeViewController.h"
#import "DSMessageViewController.h"
#import "DSDiscoverViewController.h"
#import "DSMeViewController.h"

@interface DSTabBarController ()

@property (strong, nonatomic) DSHomeViewController *homeVC;
@property (strong, nonatomic) DSMessageViewController *messageVC;
@property (strong, nonatomic) DSDiscoverViewController *discoverVC;
@property (strong, nonatomic) DSMeViewController *meVC;

@end

@implementation DSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homeVC = [DSHomeViewController new];
    [self initViewController:self.homeVC title:@"首页" imageName:@"tabbar_home"];
    
    self.messageVC = [DSMessageViewController new];
    [self initViewController:self.messageVC title:@"消息" imageName:@"tabbar_message_center"];
    
    self.discoverVC = [DSDiscoverViewController new];
    [self initViewController:self.discoverVC title:@"发现" imageName:@"tabbar_discover"];
    
    self.meVC = [DSMeViewController new];
    [self initViewController:self.meVC title:@"我" imageName:@"tabbar_profile"];
}


- (void)initViewController:(UIViewController *)myVC title:(NSString *)title imageName:(NSString *)imageName {

    myVC.title = title;
    NSDictionary *titleAttribute = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    [myVC.tabBarItem setTitleTextAttributes:titleAttribute forState:UIControlStateNormal];
                    
    myVC.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myVC.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DSNavigationController *nav = [[DSNavigationController alloc]initWithRootViewController:myVC];
    [self addChildViewController:nav];
}



@end
