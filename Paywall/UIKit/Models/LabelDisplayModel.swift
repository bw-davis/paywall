//
//  LabelDisplayModel.swift
//  Paywall
//
//  Created by Brian Davis on 4/3/22.
//  Copyright © 2022 Disney Streaming. All rights reserved.
//

import Foundation
import UIKit

class LabelDisplayModel {
    var title: String
    var textColor: UIColor
    var weight: UIFont.Weight
    var alignment: NSTextAlignment
    
    public init(title: String, textColor: UIColor, weight: UIFont.Weight, alignment: NSTextAlignment) {
        self.title = title
        self.textColor = textColor
        self.weight = weight
        self.alignment = alignment
    }
}
