//
//  HeroDeatailConfiguration.h
//  SuperDB
//
//  Created by huangbo on 13-12-11.
//  Copyright (c) 2013年 tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManagedObjectConfiguration : NSObject

-(NSInteger)numberOfSections;
-(NSInteger)numberOfRowsInSection:(NSInteger)section;
-(NSString *)headerInSection:(NSInteger)section;

-(NSDictionary *)rowForIndexPath:(NSIndexPath *)indexPath;

-(NSString *)cellClassnameForIndexPath:(NSIndexPath *)indexPath;
-(NSArray *)valuesForIndexPath:(NSIndexPath *)indexPath;
-(NSString *)attributeKeyForIndexPath:(NSIndexPath *)indexPath;
-(NSString *)labelForIndexPath:(NSIndexPath *)indexPath;

//是否动态生成
//-(BOOL)isDynamicSection:(NSInteger)section;
//-(NSString *)dynamicAttributeKeyForSection:(NSInteger)section;
-(id)initWithResource:(NSString *)resource;
@end
