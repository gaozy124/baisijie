//
//  GZYEssenceViewController.m
//  山寨百思姐
//
//  Created by 高志宇 on 16/2/9.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYEssenceViewController.h"
#import "GZYRecomendTagsViewController.h"
#import "GZYTopicViewController.h"
#import "GZYTittlesView.h"


@interface GZYEssenceViewController ()<UIScrollViewDelegate>

@property(nonatomic,weak)GZYTittlesView *tittlesView;
@property(nonatomic,weak)UIScrollView *contentView;
@property(nonatomic,weak)UIButton *selectedButton;


@end

@implementation GZYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNav];
    
    [self setupVc];
    
    [self setupTittlesView];

    [self setupContentView];
}


-(void)setupNav{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置背景
    self.view.backgroundColor = GZYGlobalBg;
    
    //设置导航标题
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    
    //设置导航按钮
    
    UIBarButtonItem *tagButton = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" highlightedImageName:@"MainTagSubIconClick" target:self action:@selector(tagClicked:)];
    
    
    self.navigationItem.leftBarButtonItem = tagButton;
 
}

-(void)setupVc{
    
    
    GZYTopicViewController *vc1 = [[GZYTopicViewController alloc] init];
    vc1.type = GZYTopicTypeAll;
    vc1.title = @"全部";
    [self addChildViewController:vc1];
    GZYTopicViewController *vc2 = [[GZYTopicViewController alloc] init];
    vc2.type = GZYTopicTypeVideo;
    vc2.title = @"视频";
    [self addChildViewController:vc2];
    GZYTopicViewController *vc3 = [[GZYTopicViewController alloc] init];
    vc3.type = GZYTopicTypeSound;
    vc3.title = @"声音";
    [self addChildViewController:vc3];
    GZYTopicViewController *vc4 = [[GZYTopicViewController alloc] init];
    vc4.type = GZYTopicTypePicture;
    vc4.title = @"图片";
    [self addChildViewController:vc4];
    GZYTopicViewController *vc5 = [[GZYTopicViewController alloc] init];
    vc5.type = GZYTopicTypeWord;
    vc5.title = @"段子";
    [self addChildViewController:vc5];
    GZYTopicViewController *vc6 = [[GZYTopicViewController alloc] init];
    vc6.type = GZYTopicTypeWord;
    vc6.title = @"排行";
    [self addChildViewController:vc6];
    GZYTopicViewController *vc7 = [[GZYTopicViewController alloc] init];
    vc7.type = GZYTopicTypeWord;
    vc7.title = @"美女";
    [self addChildViewController:vc7];
  
}


-(void)setupTittlesView{
    
    GZYTittlesView *tittlesView = [GZYTittlesView tittlesViewWithViewController:self action:@selector(tittlesViewButtonClicked:)];
    tittlesView.frame = CGRectMake(0, 64, self.view.width, 35);
    self.tittlesView = tittlesView;
    [self.view addSubview:tittlesView];
    
    
    
    
    
}


-(void)setupContentView{
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.bounds;

    contentView.contentSize = CGSizeMake(self.childViewControllers.count*contentView.width, 0);
    [self.view insertSubview:contentView atIndex:0];
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    self.contentView = contentView;
    [self tittlesViewButtonClicked:self.tittlesView.buttons[0]];

   
}




-(void)tittlesViewButtonClicked:(UIButton *)button{
    
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    NSInteger index = button.tag;
    
    self.tittlesView.positonOfIndicatorView = index;
    
    [self displayVc:index];
    
  
    
}

-(void)displayVc:(NSInteger)index{
    
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.width, 0)   animated:NO];

    UITableViewController *vc = self.childViewControllers[index];
    
    if (vc.isViewLoaded) return;

    vc.view.frame = self.contentView.bounds;

    [self.contentView addSubview:vc.view];
    
 
}



//导航按钮点击
-(void)tagClicked:(UIButton *)button{
    GZYRecomendTagsViewController  *vc = [[GZYRecomendTagsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//    UIViewController *viewController = [[UIViewController alloc] init];
//    
//    viewController.view.backgroundColor = GZYRGBColor(200, 100, 50);
//    
//    
//    [self.navigationController pushViewController:viewController animated:YES];
//    
//   
//}


#pragma mark - <UIScrollViewDelegate>





-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x/scrollView.width;
    
    [self tittlesViewButtonClicked:self.tittlesView.buttons[index]];
    
    
}























@end
