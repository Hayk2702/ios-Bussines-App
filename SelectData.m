//
//  SelectData.m
//  PowerBank
//
//  Created by Qocharyan on 9/8/19.
//  Copyright © 2019 Qocharyan. All rights reserved.
//

#import "SelectData.h"

static NSMutableArray* statictitle=nil;
static NSMutableArray* staticdesc=nil;
static NSMutableArray* staticphone=nil;
static NSMutableArray* staticlat=nil;
static NSMutableArray* staticlng=nil;
static NSMutableArray* statictext=nil;
static NSMutableArray* staticimages=nil;
static NSMutableArray* staticimages2=nil;
static NSMutableArray* staticsend=nil;
static BOOL statict=YES;
static BOOL statict1=YES;

static BOOL staticsendbool=NO;
static int staticcim;

@implementation SelectData
+(BOOL)sendbool{
    return staticsendbool;
}
+(BOOL)boolt1{
    return statict1;
}
+(int)cim{
    return staticcim;
}

+(BOOL)boolt{
    return statict;
}
+(NSMutableArray*)senddata{
    return staticsend;
}
+(NSMutableArray *)title{
    return statictitle;
}
+(NSMutableArray *)description{
    return staticdesc;
}
+(NSMutableArray *)phone{
    return staticphone;
}
+(NSMutableArray *)lat{
    return staticlat;
}
+(NSMutableArray *)lng{
    return staticlng;
}
+(NSMutableArray *)text{
    return statictext;
}
+(NSMutableArray*)images{
    return staticimages;
}
+(NSMutableArray*)images2{
    return staticimages2;
}
+(void)setsendbool:(BOOL)x{
    staticsendbool=x;
}
+(void)setsenddata:(NSMutableArray *)mdata{
    staticsend=mdata;
}
+(void)settitle:(NSMutableArray*)mtitle{
    statictitle=mtitle;
}
+(void)setdesc:(NSMutableArray *)mdesc{
    staticdesc=mdesc;
}
+(void)setphone:(NSMutableArray *)mphone{
    staticphone=mphone;
}
+(void)setlat:(NSMutableArray *)mlat{
    staticlat=mlat;
}
+(void)setlng:(NSMutableArray *)mlng{
    staticlng=mlng;
}
+(void)settext:(NSMutableArray *)mtext{
    statictext=mtext;
}
+(void)setimages:(NSMutableArray *)mimages{
    staticimages=mimages;
}
+(void)setimages2:(NSMutableArray *)mimages{
    staticimages2=mimages;
}
+(void)setboolt:(BOOL)x{
    statict=x;
}
+(void)setboolt1:(BOOL)x{
    statict1=x;
}
+(void)setcim:(int)x{
    staticcim=x;
}
@end
