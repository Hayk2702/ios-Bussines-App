//
//  help.m
//  PowerBank
//
//  Created by Qocharyan on 8/31/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "help.h"

static NSMutableDictionary* myDict=nil;
static NSMutableDictionary* myImage=nil;
@implementation help

+(NSMutableDictionary*)imageDict{
    return myImage;
}
+(void)setimage:(NSMutableDictionary *)newimage{
    myImage=newimage;
}
+(NSMutableDictionary*)curentDIct{
    return myDict;
}
+(void)setDict:(NSMutableDictionary *)newDict{
    myDict=newDict;
}
@end
