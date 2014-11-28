//
//  DetailViewController.m
//  addressBook
//
//  Created by huangbo on 14-2-23.
//  Copyright (c) 2014年 nonato. All rights reserved.
//
#import "ManagedObjectConfiguration.h"
#import "ManagedObjectController.h"
#import "SuperEditCell.h"
#import "PreviewImageViewController.h"
@interface ManagedObjectController ()<UITableViewDataSource,UITableViewDelegate>
//@property(nonatomic,strong)UITableView    * tableview;
@property(nonatomic,strong) UIBarButtonItem * saveButton;
@property(nonatomic,strong) UIBarButtonItem * backButton;
@property(nonatomic,strong) UIBarButtonItem * cancelButton;

- (void)configureView; 
@end

@implementation ManagedObjectController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}
- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.managedObject =self.detailItem; // [[self.detailItem valueForKey:@"name"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    CGRect viewframe=self.view.frame;
//    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 50, viewframe.size.width, viewframe.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundView=[[UIView alloc] init] ;//改变表的背景视图
    self.tableView.backgroundColor=[UIColor colorWithRed:232/255.0 green:233/255.0 blue:235/255.0 alpha:1];
//    [self.view addSubview:_tableview];

    [self configureView];
    
    self.navigationItem.rightBarButtonItem=self.editButtonItem;
    self.saveButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    
    self.backButton=self.navigationItem.leftBarButtonItem;
    
    self.cancelButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
}

-(void)save
{
    [self setEditing:NO animated:YES];
    
    for (SuperCell *cell in [self.tableView visibleCells]) {
        if ([cell isEditable]) {
            [self.managedObject setValue:[cell value] forKey:[cell key]];
        }
    }
    
    NSError *error;
    if (![self.managedObject.managedObjectContext save:&error]) {
        NSLog(@"Error saving %@",[error localizedDescription]);
    }
    [self.tableView reloadData];
}
-(void)cancel
{
    [self setEditing:NO animated:YES];
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView beginUpdates];
    [self.tableView setEditing:editing animated:animated];
    [self.tableView endUpdates];
    
    self.navigationItem.rightBarButtonItem=(editing)?self.saveButton:self.editButtonItem;
    self.navigationItem.leftBarButtonItem=(editing)?self.cancelButton:self.backButton;
//    [self.tableview setEditing:editing];
    
}
-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.config numberOfRowsInSection:section];
}
-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.config numberOfSections];
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 150.0;
    }
    return 40.0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellClassname=[self.config cellClassnameForIndexPath:indexPath];
    
    SuperEditCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClassname];
    if (!cell) {
        NSLog(@"----------%@",cellClassname);
        Class cellClass=NSClassFromString(cellClassname);
        cell=[cellClass alloc];
        cell=[cell initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellClassname];
    }
    cell.hero=self.managedObject;
    //    NSArray *values=[row valueForKey:@"values"];//sex 的两个值 male 和female
    NSArray *values=[self.config valuesForIndexPath:indexPath];
    if (values!=nil)
    {
        [cell performSelector:@selector(setValues:) withObject:values];
    }
    cell.label.text=[self.config labelForIndexPath:indexPath]; //[row objectForKey:@"label"];
    NSString *key=[self.config attributeKeyForIndexPath:indexPath];// description]
    cell.textfield.text=[[self.managedObject valueForKey:key] description];
    cell.delegate=self;
    cell.value=[self.managedObject valueForKey:[self.config attributeKeyForIndexPath:indexPath]];
    cell.key=[self.config attributeKeyForIndexPath:indexPath]; // [row objectForKey:@"key"];
    return cell;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCellEditingStyle editStyle=UITableViewCellEditingStyleNone;
    return editStyle;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.config headerInSection:section];
}
-(void)portrainImgTap:(NSString *)portrainImg
{
    PreviewImageViewController *previewctr=[[PreviewImageViewController alloc] init];
    previewctr.telephone=[self.managedObject valueForKey:@"phone"];
    [previewctr  reloadImgviews: portrainImg];
    
    [self presentViewController:previewctr animated:YES completion:^{
        
    }];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
