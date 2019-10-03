//
//  DominantColor.swift
//  RNDominant Color
//
//  Created by Matin ZD on 7/11/1398 AP.
//  Copyright © 1398 Facebook. All rights reserved.
//

import Foundation
import UIKit

@objc(RNDominantColor)
class RNDominantColor : NSObject {
  
  @objc
  func getColorFromURL(_ imageURL: NSString,callback successCallback: RCTResponseSenderBlock ) {
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
}
