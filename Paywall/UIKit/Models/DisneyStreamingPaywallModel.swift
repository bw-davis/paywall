//
//  DisneyStreamingPaywallModel.swift
//  Paywall
//
//  Created by Brian Davis on 4/3/22.
//  Copyright © 2022 Disney Streaming. All rights reserved.
//

import Foundation
import UIKit

public class DisneyStreamingResponseModel: Decodable {
    var backgroundImage: String?
    var backgroundColor: String?
    var brandsImage: String?
    var logoImage: String?
    var logoLabel: String?
}


public class DisneyStreamingPaywallDisplayModel {
    var backgroundColor: UIColor?
    var backgroundImage: UIImage?
    var brandsImage: UIImage?
    var logoImage: UIImage?
    var logoLabelDisplayModel: LabelDisplayModel?
    var signUpLabelDisplayModel: LabelDisplayModel?
    
    init() {
        backgroundColor = UIColor.init(hex: "#1A1D28FF")
        
        backgroundImage = getImage(from: "http://localhost:8000/images/splash2.png")
        brandsImage = getImage(from: "http://localhost:8000/images/brands2.png")
        logoImage = getImage(from: "http://localhost:8000/images/logo2.png")
        
        logoLabelDisplayModel = LabelDisplayModel()
    }
}

extension DisneyStreamingPaywallDisplayModel {
    func getImage(from string: String) -> UIImage? {
        //2. Get valid URL
        guard let url = URL(string: string)
            else {
                print("Failed to make URL")
                return nil
        }

        var image: UIImage? = nil
        do {
            //3. Get valid data
            let data = try Data(contentsOf: url, options: [])

            //4. Make image
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }

        return image
    }
}
