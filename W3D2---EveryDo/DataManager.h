//
//  DataManager.h
//  W3D2---EveryDo
//
//  Created by Dylan McCrindle on 2016-11-23.
//  Copyright © 2016 Dylan McCrindle. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface DataManager : NSObject

@property (readonly, strong) NSPersistentContainer *persistentContainer;

+ (DataManager*)sharedInstance;

- (void)saveContext;

@end
