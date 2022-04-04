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
    public var title: String?
    public var color: UIColor?
    public var weight: UIFont.Weight?
    public var alignment: NSTextAlignment?
}

class LabelResponseModel: Decodable {
    public var title: String?
    public var color: String?
    public var weight: String?
    public var alignment: String?
    public var identifier: String?
}
