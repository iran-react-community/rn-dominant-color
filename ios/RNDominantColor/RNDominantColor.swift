//
//  DominantColor.swift
//  RNDominant Color
//
//  Created by Matin ZD on 7/11/1398 AP.
//  Copyright © 1398 Facebook. All rights reserved.
//

import Foundation
import UIKit
import Photos

@objc(RNDominantColor)
class RNDominantColor : NSObject {
  
    @objc static func requiresMainQueueSetup() -> Bool {
        return false
    }
    
    @objc func getColorFromURL(_ imageURL: NSString,callback successCallback: RCTResponseSenderBlock ) {
        let url = URL(string: imageURL as String)
        let data = try? Data(contentsOf: url!)
        guard let colors = UIImage(data: data!)?.getColors() else {
          return successCallback(["#00000000", "#00000000", "#00000000", "#00000000", "#00000000"])
        }
        successCallback([
          colors.primaryHex,
          colors.secondaryHex,
          colors.backgroundHex,
          colors.detailHex
        ])
    }
    

    @objc func getColorFromAssetURL(_ imageURI: String,callback successCallback: @escaping RCTResponseSenderBlock ) {
        let url = URL(string: imageURI as String)
        let fetchResult = PHAsset.fetchAssets(withALAssetURLs: [url!], options: nil)
        if let phAsset = fetchResult.firstObject {
            PHImageManager.default().requestImageData(for: phAsset, options: nil) {
                (imageData, dataURI, orientation, info) -> Void in
                if let imageDataExists = imageData {
                    guard let colors = UIImage(data: imageDataExists)?.getColors() else {
                      return successCallback(["#00000000", "#00000000", "#00000000", "#00000000", "#00000000"])
                    }
                    successCallback([
                      colors.primaryHex,
                      colors.secondaryHex,
                      colors.backgroundHex,
                      colors.detailHex
                    ])
                }
            }
        } else {
          return successCallback(["#00000000", "#00000000", "#00000000", "#00000000", "#00000000"])
        }
    }
}