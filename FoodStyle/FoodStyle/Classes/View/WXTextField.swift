//
//  WXTextField.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class WXTextField: UITextField {

    override func textRectForBounds(bounds: CGRect) -> CGRect {
        super.textRectForBounds(bounds)
        return CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width, bounds.size.height)
    }

    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        super.placeholderRectForBounds(bounds)
        return CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width, bounds.size.height)
    }

    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        super.editingRectForBounds(bounds)
        return CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width, bounds.size.height)
    }
}
