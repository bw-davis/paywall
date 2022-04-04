//
//  PaywallResponseModel.swift
//  Paywall
//
//  Created by Brian Davis on 4/4/22.
//  Copyright © 2022 Disney Streaming. All rights reserved.
//

import Foundation

public struct PaywallResponseModel: Codable {
    var meta: Meta
    var components: [String : Components]
    var brandsImage: String?
    var logoImage: String?
    var mainLabel: String?
}

public struct Components: Codable {
    let componentType: ComponentType
}

public struct Meta: Codable {
    let backgroundImage: String
    let backgroundColor: String
    let sku: String
    let type: PaywallType
}

public enum PaywallType: String, Codable {
    case disneyStreaming
    case espn
}

public enum ComponentType: String, Codable {
    case labels
    case images
}
