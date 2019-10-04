//
//  help.h
//  PowerBank
//
//  Created by Qocharyan on 8/31/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface help : NSObject
+(NSMutableDictionary*)imageDict;
+(void)setimage:(NSMutableDictionary*)newimage;

+(NSMutableDictionary*)curentDIct;
+(void)setDict:(NSMutableDictionary*)newDict;
@end

NS_ASSUME_NONNULL_END
