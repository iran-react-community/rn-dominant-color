//
//  DominantColor.m
//  RNDominant Color
//
//  Created by Matin ZD on 7/11/1398 AP.
//  Copyright © 1398 Facebook. All rights reserved.
//

#import "RNDominantColorBridge.h"
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNDominantColor, NSObject)
RCT_EXTERN_METHOD(getColorFromURL:(NSString)imageURL callback:(RCTResponseSenderBlock *)successCallback);
@end
