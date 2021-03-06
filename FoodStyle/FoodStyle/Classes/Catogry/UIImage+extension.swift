//
//  UIImage+extension.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import Foundation
import UIKit
extension UIImage{
    func imageWithColor(color:UIColor)->UIImage{
        let rect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    func imageWithCorner()->UIImage{
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0)
        let path = UIBezierPath(ovalInRect: CGRectMake(0,0,self.size.width,self.size.height))
        path.addClip()
        drawAtPoint(CGPointZero)
        let cornerImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return cornerImage
    }
}
