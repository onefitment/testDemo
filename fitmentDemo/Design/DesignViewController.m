//
//  DesignViewController.m
//  fitmentDemo
//
//  Created by 朱恪帅 on 14/11/16.
//  Copyright (c) 2014年 zks. All rights reserved.
//

#import "DesignViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "AsyncImageView.h"
#import "HttpTool.h"
#import "WaterList.h"
#import "WaterImageContent.h"
#import "WaterList.h"
#import "NSString+zks.h"


#define NUMBER_OF_COLUMNS 3
#define NUMBER_OF_ROWS    6
#define baseUrl  http://www.to8to.com/mobileapp/zxhelper.php?action=getimg&p=%d&z=0&s=0&j=0&o=0&pg=33&h=0

@interface DesignViewController ()
{
    int count;
    WaterflowView *flowView;
}
@property (nonatomic,retain) NSMutableArray *imageUrls;
@property (nonatomic,readwrite) int currentPage;

@property (nonatomic,strong) NSMutableArray *waterImageUrls;
@end
@implementation DesignViewController
@synthesize imageUrls=_imageUrls;
@synthesize currentPage=_currentPage;
- (id)init
{
    self = [super init];
    if (self) {
        self.navigationController.view.backgroundColor = [UIColor blueColor];
        self.tabBarItem.image = [UIImage imageNamed:@"bar_pic"];
        self.tabBarItem.title = @"设计";
        self.title = @"设计";
    }
    return self;
}

//- (void)viewWillDisappear:(BOOL)animated
//{
//    [self loadNewData];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    [self loadNewData];
    
    flowView = [[WaterflowView alloc] initWithFrame:self.view.frame];
    flowView.flowdatasource = self;
    flowView.flowdelegate = self;
    [self.view addSubview:flowView];
    
    self.currentPage = 1;
    
//    self.imageUrls = [NSMutableArray array];
//    self.imageUrls = [NSMutableArray arrayWithObjects:@"http://img.topit.me/l/201008/11/12815218412635.jpg",@"http://photo.l99.com/bigger/22/1284013907276_zb834a.jpg",@"http://www.webdesign.org/img_articles/7072/BW-kitten.jpg",@"http://www.raiseakitten.com/wp-content/uploads/2012/03/kitten.jpg",@"http://imagecache6.allposters.com/LRG/21/2144/C8BCD00Z.jpg",nil];
    
    
}

- (void)loadNewData
{
    NSString *stringUrl = [NSString stringWithFormat:@"http://www.to8to.com/mobileapp/zxhelper.php?action=getimg&p=%d&z=0&s=0&j=0&o=0&pg=33&h=0",self.currentPage];
    
    [HttpTool getWith:stringUrl parameters:nil success:^(id JSON) {
        //解析json
        NSDictionary *listDict = JSON;
        WaterList *waterList = [[WaterList alloc] initWithDict:listDict];
        NSLog(@"waterImage count:%lu",(unsigned long)waterList.waterImages.count);
        for (int i = 0; i < waterList.waterImages.count; i ++) {
            WaterImageContent *waterImageCount = [waterList.waterImages objectAtIndex:i];
//            NSLog(@"fileName:%@",[waterImageCount.filename imageAppend]);
            [self.imageUrls addObject:[waterImageCount.filename imageAppend]];
            
        }
        [flowView reloadData];

    } failure:^(NSError *error) {
        NSLog(@"cuowo");
    }];
//    [flowView reloadData];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [flowView reloadData];  //safer to do it here, in case it may delay viewDidLoad
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark-
#pragma mark- WaterflowDataSource

- (NSInteger)numberOfColumnsInFlowView:(WaterflowView *)flowView
{
    return NUMBER_OF_COLUMNS;
}

- (NSInteger)flowView:(WaterflowView *)flowView numberOfRowsInColumn:(NSInteger)column
{
    return NUMBER_OF_ROWS;
}

//- (WaterFlowCell *)flowView:(WaterflowView *)flowView_ cellForRowAtIndex:(NSInteger)index
//{
//    static NSString *CellIdentifier = @"Cell";
//	WaterFlowCell *cell = [flowView_ dequeueReusableCellWithIdentifier:CellIdentifier];
//
//	if(cell == nil)
//	{
//		cell  = [[[WaterFlowCell alloc] initWithReuseIdentifier:CellIdentifier] autorelease];
//
//		AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectZero];
//		[cell addSubview:imageView];
//        imageView.contentMode = UIViewContentModeScaleToFill;
//		imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
//		imageView.layer.borderWidth = 1;
//		[imageView release];
//		imageView.tag = 1001;
//	}
//
//    float height = [self flowView:nil heightForCellAtIndex:index];
//
//    AsyncImageView *imageView  = (AsyncImageView *)[cell viewWithTag:1001];
//	imageView.frame = CGRectMake(0, 0, self.view.frame.size.width / NUMBER_OF_COLUMNS, height);
//    NSLog(@"index:%d",index);
//    [imageView loadImage:[self.imageUrls objectAtIndex:index % 5]];
//
//	return cell;
//
//}

- (WaterFlowCell*)flowView:(WaterflowView *)flowView_ cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    WaterFlowCell *cell = [flowView_ dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell  = [[WaterFlowCell alloc] initWithReuseIdentifier:CellIdentifier];
        
        AsyncImageView *imageView = [[AsyncImageView alloc] initWithFrame:CGRectZero];
        [cell addSubview:imageView];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
        imageView.layer.borderWidth = 1;
        imageView.tag = 1001;
    }
    
    float height = [self flowView:nil heightForRowAtIndexPath:indexPath];
    NSLog(@"index:%ld",indexPath.section + indexPath.row * 3);
    
    AsyncImageView *imageView  = (AsyncImageView *)[cell viewWithTag:1001];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width / 3, height);
//    NSLog(@"index count:%@",[self.imageUrls objectAtIndex:(indexPath.row + indexPath.section)]);
    [imageView loadImage:[self.imageUrls objectAtIndex:(indexPath.row + indexPath.section)] ];
    
    return cell;
    
}

#pragma mark-
#pragma mark- WaterflowDelegate

- (CGFloat)flowView:(WaterflowView *)flowView heightForCellAtIndex:(NSInteger)index
{
    float height = 0;
    switch (index  % 5) {
        case 0:
            height = 127;
            break;
        case 1:
            height = 100;
            break;
        case 2:
            height = 87;
            break;
        case 3:
            height = 114;
            break;
        case 4:
            height = 140;
            break;
        case 5:
            height = 158;
            break;
        default:
            break;
    }
    
    return height;
}

-(CGFloat)flowView:(WaterflowView *)flowView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    float height = 0;
    switch ((indexPath.row + indexPath.section )  % 5) {
        case 0:
            height = 127;
            break;
        case 1:
            height = 100;
            break;
        case 2:
            height = 87;
            break;
        case 3:
            height = 114;
            break;
        case 4:
            height = 140;
            break;
        case 5:
            height = 158;
            break;
        default:
            break;
    }
    
    height += indexPath.row + indexPath.section;
    
    return height;
    
}

- (void)flowView:(WaterflowView *)flowView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"%@",flowView);
    NSLog(@"did select at %@",indexPath);
}

- (void)flowView:(WaterflowView *)flowView didSelectAtCell:(WaterFlowCell *)cell ForIndex:(int)index
{
    NSLog(@"点击");
}

- (void)flowView:(WaterflowView *)_flowView willLoadData:(int)page
{
    //make a judegement to decide whether to call reloadData or reloadFailed
    [flowView reloadData];
}


@end
