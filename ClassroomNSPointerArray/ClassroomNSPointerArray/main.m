//
//  main.m
//  ClassroomNSPointerArray
//
//  Created by Dmitriy Tarelkin on 13/4/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


int main(int argc, char * argv[]) {
    @autoreleasepool {
        
//1 Create pointer array and add 10 objects inside.

        NSPointerArray* pointerArray =  [NSPointerArray weakObjectsPointerArray];
        NSMutableArray* mutArray = [NSMutableArray array];
        
        for (int i = 0; i < 10; i+=1) {
            [mutArray addObject:[NSNumber numberWithInteger: arc4random_uniform(100)]];
            [pointerArray addPointer:(__bridge void*)[mutArray objectAtIndex:i]];
        }
        
        
        
//2 Check arrays count.
        NSLog(@"Array consists of %lu elements",(unsigned long)[pointerArray count]); //10
        
//3 Nil several objects, added to the array and check count once again.
        [pointerArray replacePointerAtIndex:1 withPointer:nil];
        [pointerArray replacePointerAtIndex:2 withPointer:nil];
        [pointerArray replacePointerAtIndex:3 withPointer:nil];
        
        for (id pointer in pointerArray  ) {
            NSLog(@"%@", pointer);
        }
        
        NSLog(@"Array consists of %lu elements",(unsigned long)[pointerArray count]); //10
        
//        [pointerArray removePointerAtIndex:2];
//        [pointerArray removePointerAtIndex:1];
//        [pointerArray removePointerAtIndex:7];
//        [pointerArray removePointerAtIndex:3];
//        NSLog(@"Array consist of %lu elements",(unsigned long)[pointerArray count]); //6
        
        
//  releasing the objects

        [pointerArray release];
        [mutArray release];
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
