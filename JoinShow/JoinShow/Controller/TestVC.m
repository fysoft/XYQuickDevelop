//
//  TestVC.m
//  JoinShow
//
//  Created by Heaven on 13-9-1.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "TestVC.h"
#import "UIView+Test.h"
#import "TestView.h"
#import "AutoSizeView.h"

@interface TestVC ()

@end

@implementation TestVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.array = [NSMutableArray alloc];
    }
    return self;
}
- (void)dealloc
{
    self.array = nil;
    [super dealloc];
}
/*
- (void)loadView
{

}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  //  [XYTimer sharedInstance].delegate = self;
  //  [[XYTimer sharedInstance] startTimerWithInterval:1];
    
    TestView *tempView = [[TestView alloc] initWithFrame:CGRectMake(100, 000, 40, 40)];
    tempView.backgroundColor = [UIColor grayColor];
    tempView.userInteractionEnabled = YES;
    [tempView addTapGestureWithBlock:^{
        NSLogDD
    }];
    [tempView test];
    [self.view addSubview:tempView];
    [tempView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBtn1:(id)sender {
    for (int i = 0; i < 1000; i++) {
        NSNumber *n = [NSNumber numberWithInt:i];
        NSString *str = [NSString stringWithFormat:@"%d", i];
        NSNumber *a = [NSNumber numberWithInt:i + offset];
        NSNumber *b = [NSNumber numberWithInt:i + 10000];
        objc_setAssociatedObject(self, n, a, OBJC_ASSOCIATION_COPY);
        
        objc_setAssociatedObject(_array, n, b, OBJC_ASSOCIATION_COPY);
    }
    offset += 1000;
}

- (IBAction)clickBtn2:(id)sender {
    NSNumber *a = objc_getAssociatedObject(self, [NSString stringWithFormat:@"%d", 0]);
    NSNumber *b = objc_getAssociatedObject(_array, [NSString stringWithFormat:@"%d", 0]);
    NSLogD(@"self : %@, array : %@", a, b);
}


/////////////////////////// 备注 ///////////////////////////////
/*
void objc_setAssociatedObject(id object, void *key, id value, objc_AssociationPolicy policy) {
    if (UseGC) {
        //这部分是有垃圾回收机制的实现，我们不用管
        if ((policy & OBJC_ASSOCIATION_COPY_NONATOMIC) == OBJC_ASSOCIATION_COPY_NONATOMIC) {
            value = objc_msgSend(value, @selector(copy));
        }
        auto_zone_set_associative_ref(gc_zone, object, key, value);
    } else {
        //这是引用计数机制部分的实现
        // Note, creates a retained reference in non-GC.
        _object_set_associative_reference(object, key, value, policy);
    }
}
 */

// 自动布局
/*
- (void)loadView
{
    //initalize
    AutoSizeView *view = [[AutoSizeView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 108.0)];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 64.0) style:UITableViewStylePlain];
    
    //config view
    [view setBackgroundColor:[UIColor colorWithWhite:47.0/255.0 alpha:1.0]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    tableView.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
    
    //assgin view
    self.view = view;
    self.tableView = tableView;
    [view release];
    [tableView release];
    
    //addsubview
    [self.view addSubview:self.tableView];
}
*/
@end
