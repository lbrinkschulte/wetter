//
//  URLReader.h
//  Wetter1
//
//  Created by Volker Funke on 18.08.15.
//  Copyright © 2015 Volker Funke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLReader : NSObject
+(URLReader *)urlReader;
+(NSURL *)urlForCity:(NSString *)city andCountry:(NSString *)country;
+(NSURL *)urlForID:(NSNumber *)id;
-(void) queryAsyncURL: (NSURL *)url handler: (void(^)(NSDictionary *))handler;
@end
