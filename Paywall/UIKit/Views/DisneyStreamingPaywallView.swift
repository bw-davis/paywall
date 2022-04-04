//
//  DisneyStreamingPaywallView.swift
//  Paywall
//
//  Created by Brian Davis on 4/3/22.
//  Copyright © 2022 Disney Streaming. All rights reserved.
//

import Foundation
import UIKit

public class DisneyStreamingPaywallView: UIView {
    var backgroundView = UIView()
    var lineSeparator = UIView()
    var backgroundImageView = UIImageView()
    var bgColor = UIColor()
    var brandsImageView = UIImageView()
    var logoImageView = UIImageView()
    var mainLabel = UILabel()
    var signUpButton = UIButton()
    var secondaryLabel = UILabel()
    
    var loginButton = UIButton()
    
    private var largePadding: CGFloat = 50.0
    private var smallPadding: CGFloat = 8.0
    private var logoLabelFontSize: CGFloat = 17.0
    private var signUpButtonFont: CGFloat = 16.0
    private var signUpInfoLabelFont: CGFloat = 14.0
    private var labelAndButtonHeight: CGFloat = 52.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundView.backgroundColor = UIColor.init(hex: "#1A1D28FF")
        addSubview(backgroundView)
        
        let backgroundImage = getImage(from: "http://localhost:8000/images/splash2.png")
        backgroundImageView.image = backgroundImage
        backgroundView.addSubview(backgroundImageView)
        
        let logoImage = getImage(from: "http://localhost:8000/images/logo2.png")
        logoImageView.image = logoImage
        backgroundView.addSubview(logoImageView)
        
        mainLabel.text = "The best stories in all the world, all in one place."
        mainLabel.font = UIFont.systemFont(ofSize: logoLabelFontSize, weight: .bold)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        mainLabel.textColor = UIColor.init(hex: "#F8F8FFFF")
        mainLabel.backgroundColor = .clear
        backgroundView.addSubview(mainLabel)
        
        let brandsImage = getImage(from: "http://localhost:8000/images/brands2.png")
        brandsImageView.image = brandsImage
        backgroundView.addSubview(brandsImageView)
        
        let buttonTitleText = "SIGN UP NOW"
        signUpButton.setTitle(buttonTitleText, for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: signUpButtonFont, weight: .semibold)
        signUpButton.tintColor = UIColor.init(hex: "#0172D2FF")
        signUpButton.backgroundColor = UIColor.init(hex: "#0172D2FF")
//        signUpButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        backgroundView.addSubview(signUpButton)
        
        secondaryLabel.text = "Start streaming Disney+ with your 7 day free trial, then only 6.99/month"
        secondaryLabel.font = UIFont.systemFont(ofSize: signUpInfoLabelFont, weight: .regular)
        secondaryLabel.textAlignment = .center
        secondaryLabel.numberOfLines = 0
        secondaryLabel.textColor = .lightText
        secondaryLabel.backgroundColor = .clear
        backgroundView.addSubview(secondaryLabel)
        
        lineSeparator.backgroundColor = UIColor.white
        backgroundView.addSubview(lineSeparator)
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: logoLabelFontSize, weight: .semibold)
        loginButton.backgroundColor = .clear
        loginButton.tintColor = .clear
        backgroundView.addSubview(loginButton)
    }
    
    public override func layoutSubviews() {
        backgroundView.frame = CGRect(x: 0.0, y: 0.0, width: bounds.width, height: bounds.height)
        
        let bgImageSize = backgroundImageView.image?.size ?? CGSize.zero
        let bgImageViewFrame = CGRect(x: 0,
                                      y: -smallPadding*2.0,
                                      width: bgImageSize.width,
                                      height: bgImageSize.height)
        backgroundImageView.frame = bgImageViewFrame
        
        let logoImageSize = logoImageView.image?.size ?? CGSize.zero
        let logoImageViewFrame = CGRect(x: (bounds.width-logoImageSize.width)/2.0,
                                        y: ((bounds.height-logoImageSize.height)/2.0)-60.0,
                                        width: logoImageSize.width,
                                        height: logoImageSize.height)
        logoImageView.frame = logoImageViewFrame
        
        let mainLabelFrame = CGRect(x: largePadding,
                                    y: logoImageViewFrame.maxY+smallPadding,
                                    width: bounds.width-(largePadding*2),
                                    height: labelAndButtonHeight)
        mainLabel.frame = mainLabelFrame
        
        let brandsImageSize = brandsImageView.image?.size ?? CGSize.zero
        let brandsImageViewFrame = CGRect(x: (bounds.width-brandsImageSize.width)/2.0,
                                          y: mainLabelFrame.maxY+smallPadding,
                                          width: brandsImageSize.width,
                                          height: brandsImageSize.height)
        brandsImageView.frame = brandsImageViewFrame
        
        // sign up button frame appears to be the same width and have same starting x as the brands image
        let signUpButtonFrame = CGRect(x: brandsImageViewFrame.minX,
                                       y: brandsImageViewFrame.maxY+(largePadding*2.5),
                                       width: brandsImageViewFrame.width,
                                       height: labelAndButtonHeight)
        signUpButton.frame = signUpButtonFrame
        
        // the sign up label appears to have same dimensions as the sign up button
        let secondaryLabelFrame = CGRect(x: signUpButtonFrame.minX,
                                      y: signUpButtonFrame.maxY+smallPadding,
                                      width: signUpButtonFrame.width,
                                      height: labelAndButtonHeight)
        secondaryLabel.frame = secondaryLabelFrame
        
        let lineSeparatorFrame = CGRect(x: 0.0,
                                        y: secondaryLabelFrame.maxY+(smallPadding*3.0),
                                        width: bounds.width,
                                        height: 1.0)
        lineSeparator.frame = lineSeparatorFrame
        
        let size = loginButton.intrinsicContentSize
        let loginFrame = CGRect(x: (bounds.width-size.width)/2.0,
                                y: lineSeparatorFrame.maxY+(smallPadding*3.0),
                                width: size.width,
                                height: size.height)
        loginButton.frame = loginFrame
    }
}

extension DisneyStreamingPaywallView {
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
