//
//  Common.m
//  VMTSAPP
//
//  Created by appie on 15-1-6.
//  Copyright (c) 2015年 Seuic. All rights reserved.
//

#import "Common.h"

@implementation Common


+(CGRect)GetALLScreen
{
    CGRect r = [ UIScreen mainScreen ].applicationFrame;
    return r;
}


+(CGRect)GetScreen
{
    CGRect r = [ UIScreen mainScreen ].bounds;
    return r;
}

+(BarcodeStruct)GetCheckBarcode:(NSString *)code
{
    BarcodeStruct barcode;
    NSString *strbarcode = [code stringByReplacingOccurrencesOfString:@"," withString:@"，"];
    NSArray *aArray = [strbarcode componentsSeparatedByString:@"，"];
    if (aArray.count != 5) {
        if (code.length <24)
        {
            barcode.result=1;//失败
            barcode.isCode=false;
            return barcode;
        }
        barcode.result=2;//容错
        barcode.code = [[code substringToIndex:24] UTF8String];
        barcode.isCode=true;
        return barcode;
    }
    barcode.result=0;
    NSString *data=[aArray objectAtIndex:0];
    barcode.code =[data UTF8String];
    data=[aArray objectAtIndex:1];
    barcode.cpinfo =[data UTF8String];
    data=[aArray objectAtIndex:2];
    barcode.pzwh =[data UTF8String];
    data=[aArray objectAtIndex:3];
    barcode.company =[data UTF8String];
    data=[aArray objectAtIndex:4];
    barcode.tel =[data UTF8String];
    barcode.isCode=true;
    
    return barcode;
    
}


+(BOOL)HttpPostUrl:(NSURL *)url EncodeData:(NSData *)Dictionarydata delegateview:(NSObject<NSURLConnectionDataDelegate> *) queryview
{
    
    
    //post提交的参数，格式如下：201403270000200101860785
    //参数1名字=参数1数据&参数2名字＝参数2数据&参数3名字＝参数3数据&...
    //    NSString *post = @"zsm=201403270000200101860785";
    
    //    NSLog(@"post:%@",post);
    
    //将NSSrring格式的参数转换格式为NSData，POST提交必须用NSData数据。
    //    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    //计算POST提交数据的长度
    NSString *postLength = [NSString stringWithFormat:@"%d",[Dictionarydata length]];
    NSLog(@"postLength=%@",postLength);
    //定义NSMutableURLRequest
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    //设置提交目的url
    
    
    //    NSString *jsonUrlString = [NSString stringWithFormat:@"http://sysy.ivdc.org.cn:8081/SyZs/commons/public/getZsmInfo.do?isRes=true"];
    //    NSURL *url1 = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    //        [request setURL:url1];
    
    //设置提交方式为 POST
    [request setHTTPMethod:@"POST"];
    //设置http-header:Content-Type
    //这里设置为 application/x-www-form-urlencoded ，如果设置为其它的，比如text/html;charset=utf-8，或者 text/html 等，都会出错。不知道什么原因。
    [request setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    //设置http-header:Content-Length
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //设置需要post提交的内容
    [request setHTTPBody:Dictionarydata];
    
    
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:queryview];
    if (connection) {
        return YES;
    }else{
        return NO;
    }
    
    
//    //定义
//    NSHTTPURLResponse* urlResponse = nil;
//    NSError *error = [[NSError alloc] init];
//    //同步提交:POST提交并等待返回值（同步），返回值是NSData类型。
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
//    //将NSData类型的返回值转换成NSString类型
//    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//    NSString *result = [[NSString alloc] initWithData:responseData encoding:gbkEncoding];
//    NSLog(@"code:%d",urlResponse.statusCode);
//    NSLog(@"user login check result:%@",result);
    
    //    if ([@"success" compare:result]==NSOrderedSame) {
    //        return YES;
    //    }
    //    return NO;
    
    
    
  
}


+(NSString *)HttpPostUrl:(NSURL *)url EncodeData:(NSData *)Dictionarydata
{
    
   
    //post提交的参数，格式如下：201403270000200101860785
    //参数1名字=参数1数据&参数2名字＝参数2数据&参数3名字＝参数3数据&...
//    NSString *post = @"zsm=201403270000200101860785";
    
//    NSLog(@"post:%@",post);
    
    //将NSSrring格式的参数转换格式为NSData，POST提交必须用NSData数据。
//    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    //计算POST提交数据的长度
    NSString *postLength = [NSString stringWithFormat:@"%d",[Dictionarydata length]];
    NSLog(@"postLength=%@",postLength);
    //定义NSMutableURLRequest
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    //设置提交目的url

    
//    NSString *jsonUrlString = [NSString stringWithFormat:@"http://sysy.ivdc.org.cn:8081/SyZs/commons/public/getZsmInfo.do?isRes=true"];
//    NSURL *url1 = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//        [request setURL:url1];
    
    //设置提交方式为 POST
    [request setHTTPMethod:@"POST"];
    //设置http-header:Content-Type
    //这里设置为 application/x-www-form-urlencoded ，如果设置为其它的，比如text/html;charset=utf-8，或者 text/html 等，都会出错。不知道什么原因。
    [request setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    //设置http-header:Content-Length
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //设置需要post提交的内容
    [request setHTTPBody:Dictionarydata];
    
    //定义
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    //同步提交:POST提交并等待返回值（同步），返回值是NSData类型。
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    //将NSData类型的返回值转换成NSString类型
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *result = [[NSString alloc] initWithData:responseData encoding:gbkEncoding];
    NSLog(@"code:%d",urlResponse.statusCode);
    NSLog(@"user login check result:%@",result);
    
//    if ([@"success" compare:result]==NSOrderedSame) {
//        return YES;
//    }
//    return NO;

    
    
    return result;
}

+(NSData*)encodeDictionary:(NSDictionary*)dictionary {
    NSMutableArray *parts = [[NSMutableArray alloc] init];
    for (NSString *key in dictionary) {
        NSString *encodedValue = [[dictionary objectForKey:key] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *encodedKey = [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *part = [NSString stringWithFormat: @"%@=%@", encodedKey, encodedValue];
        [parts addObject:part];
    }
    NSString *encodedDictionary = [parts componentsJoinedByString:@"&"];
    return [encodedDictionary dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
}

+(NSString*)CheckURl:(NSString *)barcode
{
    NSString *Urlregex = @"http://([\\w-]+\\.)+[\\w-]+(/[\\w- ./?%&=]*)?";//@"((http|https)://)([A-Za-z0-9-]+.)+[A-Za-z]{2,}(:[0-9]+)?";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:Urlregex options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSTextCheckingResult *resulting =[regex firstMatchInString:barcode options:NSMatchingReportProgress range:NSMakeRange(0, [barcode length])];
    
    
    NSString *result=[barcode substringWithRange:resulting.range];
    return result;
 
    
    
    
    
    
}
@end
