//
//  DisneyStreamingPaywallView.swift
//  Paywall
//
//  Created by Brian Davis on 4/3/22.
//  Copyright © 2022 Disney Streaming. All rights reserved.
//

import Foundation
import UIKit

public class DisneyStreamingPaywallView: UIView, PaywallViewProtocol {
    var backgroundView = UIView()
    var lineSeparator = UIView()
        
    var backgroundImageView = UIImageView()
    var brandsImageView = UIImageView()
    var logoImageView = UIImageView()
    
    var mainLabel = UILabel()
    var secondaryLabel = UILabel()
    
    var signUpButton = UIButton()
    var loginButton = UIButton()
    
    private var largePadding: CGFloat = 50.0
    private var smallPadding: CGFloat = 8.0
    
    private var signUpInfoLabelFont: CGFloat = 14.0
    private var signUpButtonFont: CGFloat = 16.0
    private var logoLabelFontSize: CGFloat = 17.0
    
    private var labelAndButtonHeight: CGFloat = 52.0
    
    private var alertSku: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(from model: DisneyStreamingPaywallModel) {
        if let sku = model.sku {
            alertSku = sku
        }
        
        backgroundView.backgroundColor = model.backgroundColor
        addSubview(backgroundView)
        
        // setup background image
        if let backgroundImage = model.backgroundImage {
            backgroundImageView.image = backgroundImage
            backgroundView.addSubview(backgroundImageView)
        }
        
        // setup logo image
        if let logoImage = model.logoImage {
            logoImageView.image = logoImage
            backgroundView.addSubview(logoImageView)
        }
        
        // setup main label
        if let mainLabelDisplayModel = model.mainLabelDisplayModel {
            mainLabel.text = mainLabelDisplayModel.title
            mainLabel.font = UIFont.systemFont(ofSize: logoLabelFontSize, weight: mainLabelDisplayModel.weight)
            mainLabel.textAlignment = mainLabelDisplayModel.alignment
            mainLabel.numberOfLines = 0
            mainLabel.textColor = mainLabelDisplayModel.textColor
            mainLabel.backgroundColor = .clear
            backgroundView.addSubview(mainLabel)
        }
        
        // setup brands image
        if let brandsImage = model.brandsImage {
            brandsImageView.image = brandsImage
            backgroundView.addSubview(brandsImageView)
        }
        
        let buttonTitleText = "SIGN UP NOW"
        signUpButton.setTitle(buttonTitleText, for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: signUpButtonFont, weight: .semibold)
        signUpButton.tintColor = UIColor.init(hex: "#0172D2FF")
        signUpButton.backgroundColor = UIColor.init(hex: "#0172D2FF")
        signUpButton.addTarget(self, action:#selector(showAlert), for: .touchUpInside)
        backgroundView.addSubview(signUpButton)
        
        // setup secondady label
        if let secondaryLabelDisplayModel = model.secondaryLabelDisplayModel {
            secondaryLabel.text = secondaryLabelDisplayModel.title
            secondaryLabel.font = UIFont.systemFont(ofSize: signUpInfoLabelFont, weight: secondaryLabelDisplayModel.weight)
            secondaryLabel.textAlignment = secondaryLabelDisplayModel.alignment
            secondaryLabel.numberOfLines = 0
            secondaryLabel.textColor = secondaryLabelDisplayModel.textColor
            secondaryLabel.backgroundColor = .clear
            backgroundView.addSubview(secondaryLabel)
        }

        // setup line separator
        lineSeparator.backgroundColor = UIColor.white
        backgroundView.addSubview(lineSeparator)
        
        let loginTitleText = "Log In"
        loginButton.setTitle(loginTitleText, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: logoLabelFontSize, weight: .semibold)
        loginButton.backgroundColor = .clear
        loginButton.tintColor = .clear
        backgroundView.addSubview(loginButton)
    }
    
    // setup the frames for the view
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
    
    @objc
    func showAlert() {
        let alertController = UIAlertController(title: nil,
                                                message: "Purchase \(alertSku)",
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Purchase", style: .default))
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
