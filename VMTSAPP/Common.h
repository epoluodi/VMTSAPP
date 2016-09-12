//
//  Common.h
//  VMTSAPP
//
//  Created by appie on 15-1-6.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


struct BarcodeClass
{
    BOOL isCode;
    const char   *code;
    const char *cpinfo;
    const char *pzwh;
    const char *company;
    const char *tel;
    const char *barcode;
    int result;
    
};
typedef  struct BarcodeClass BarcodeStruct;
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface Common : NSObject


+(CGRect)GetScreen;
+(CGRect)GetALLScreen;
+(BarcodeStruct)GetCheckBarcode:(NSString *)code;

+(BOOL)HttpPostUrl:(NSURL *)url EncodeData:(NSData *)Dictionarydata delegateview:(NSObject<NSURLConnectionDataDelegate> *) queryview;
+(NSString *)HttpPostUrl:(NSURL *)url EncodeData:(NSData *)Dictionarydata;
+(NSData*)encodeDictionary:(NSDictionary*)dictionary;
+(NSString *)CheckURl:(NSString *)barcode;

@end


@protocol queryparams

-(void)cancelquery;
-(void)SetqueryParams:(NSString *)params;
-(void)SetqueryDataTypeParams:(NSString *)params;
@end
