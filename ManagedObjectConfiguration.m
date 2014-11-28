//
//  HeroDeatailConfiguration.m
//  SuperDB
//
//  Created by huangbo on 13-12-11.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import "ManagedObjectConfiguration.h"
@interface ManagedObjectConfiguration()
@property(strong,nonatomic)NSArray *sections;
@end;

@implementation ManagedObjectConfiguration
-(id)init
{
    self=[super init];
    if (self) {
        NSURL *plistURL=[[NSBundle mainBundle] URLForResource:@"ContactsDetail" withExtension:@"plist"];
        NSDictionary *plist=[NSDictionary dictionaryWithContentsOfURL:plistURL];
        self.sections=[plist valueForKey:@"sections"];
    }
    return self;
}
-(id)initWithResource:(NSString *)resource
{
    self=[super init];
    if (self) {
        NSURL *plistURL=[[NSBundle mainBundle] URLForResource:resource withExtension:@"plist"];
        NSDictionary *plist=[NSDictionary dictionaryWithContentsOfURL:plistURL];
        self.sections=[plist valueForKey:@"sections"];
    }
    return self;    
}

-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *sectionDict=[self.sections objectAtIndex:section];
    NSArray *rows=[sectionDict objectForKey:@"rows"];
    return rows.count;
}

-(NSInteger)numberOfSections
{
    return self.sections.count;
}

-(NSString *)headerInSection:(NSInteger)section
{
    NSDictionary *sectionDict=[self.sections objectAtIndex:section];
    return [sectionDict objectForKey:@"header"];
}
 
-(NSDictionary*)rowForIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sectionIndex=[indexPath section];
    NSUInteger rowIndex=[indexPath row];
    NSDictionary *section=[self.sections objectAtIndex:sectionIndex];
    NSArray *rows=[section objectForKey:@"rows"];
    NSDictionary *row=[rows objectAtIndex:rowIndex];
    return row;
}

-(NSString *)cellClassnameForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row valueForKey:@"class"];
}

-(NSArray *)valuesForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row valueForKey:@"values"];
}
//属性关键字key
-(NSString *)attributeKeyForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row objectForKey:@"key"];
}

-(NSString *)labelForIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *row=[self rowForIndexPath:indexPath];
    return [row objectForKey:@"label"];
}

//-(BOOL)isDynamicSection:(NSInteger)section
//{
//    BOOL dynamic=NO;
//    NSDictionary *sectionDict=[self.sections objectAtIndex:section];
//    NSNumber *dynamicNumber=[sectionDict objectForKey:@"dynamic"];
//    if(dynamicNumber!=NULL)
//    {
//        dynamic=[dynamicNumber boolValue];
//    }
//    return dynamic;
//}

//-(NSString *)dynamicAttributeKeyForSection:(NSInteger)section
//{
//    if(![self isDynamicSection:section])
//        return nil;
//    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:section];
//    return [self attributeKeyForIndexPath:indexPath];
//}

@end
