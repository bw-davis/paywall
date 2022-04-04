//
//  DisneyStreamingPaywallModel.swift
//  Paywall
//
//  Created by Brian Davis on 4/3/22.
//  Copyright © 2022 Disney Streaming. All rights reserved.
//

import Foundation
import UIKit

public class DisneyStreamingPaywallModel: PaywallModelProtocol {
    var backgroundColor: UIColor?
    
    var backgroundImage: UIImage?
    var brandsImage: UIImage?
    var logoImage: UIImage?
    
    var mainLabelDisplayModel: LabelDisplayModel?
    var secondaryLabelDisplayModel: LabelDisplayModel?
    
    var sku: String?
    
    init() {
        backgroundColor = UIColor.init(hex: "#1A1D28FF")
        
        // set the images
        backgroundImage = getImage(from: "http://localhost:8000/images/splash2.png")
        brandsImage = getImage(from: "http://localhost:8000/images/brands2.png")
        logoImage = getImage(from: "http://localhost:8000/images/logo2.png")
        
        // make the label display models
        let mainTextColor = UIColor.init(hex: "#F8F8FFFF") ?? UIColor()
        mainLabelDisplayModel = LabelDisplayModel(title: "The best stories in all the world, all in one place.",
                                                  textColor: mainTextColor,
                                                  weight: .bold,
                                                  alignment: .center)
        
        let secondaryTextColor = UIColor.init(hex: "#F8F8FFFF") ?? UIColor()
        secondaryLabelDisplayModel = LabelDisplayModel(title: "Start streaming Disney+ with your 7 day free trial, then only 6.99/month",
                                                       textColor: secondaryTextColor,
                                                       weight: .light,
                                                       alignment: .center)
        
        sku = "dplus_free_trial"
    }
}

extension DisneyStreamingPaywallModel {
    func getImage(from string: String) -> UIImage? {
        guard let url = URL(string: string)
            else {
                print("Failed to make URL")
                return nil
        }

        var image: UIImage? = nil
        do {
            let data = try Data(contentsOf: url, options: [])

            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }

        return image
    }
}
