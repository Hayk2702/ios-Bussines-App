//
//  SelectData.h
//  PowerBank
//
//  Created by Qocharyan on 9/8/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectData : NSObject
+(NSMutableArray *)title;
+(NSMutableArray *)description;
+(NSMutableArray *)phone;
+(NSMutableArray *)lat;
+(NSMutableArray *)lng;
+(NSMutableArray *)text;
+(NSMutableArray*)images;
+(NSMutableArray*)images2;

+(BOOL)boolt;
+(BOOL)sendbool;
+(BOOL)boolt1;

+(NSMutableArray*)senddata;
+(int)cim;
+(void)setcim:(int)x;

+(void)setsenddata:(NSMutableArray*)mdata;
+(void)setsendbool:(BOOL)x;
+(void)setboolt:(BOOL)x;
+(void)setboolt1:(BOOL)x;
+(void)settitle:(NSMutableArray*)mtitle;
+(void)setdesc:(NSMutableArray *)mdesc;
+(void)setphone:(NSMutableArray *)mphone;
+(void)setlat:(NSMutableArray *)mlat;
+(void)setlng:(NSMutableArray *)mlng;
+(void)settext:(NSMutableArray *)mtext;
+(void)setimages:(NSMutableArray*)mimages;
+(void)setimages2:(NSMutableArray*)mimages;


@end

NS_ASSUME_NONNULL_END
