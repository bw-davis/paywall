//
//  SceneDelegate.swift
//  Paywall
//
//  Copyright © 2020 Disney Streaming. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }

    let window = UIWindow(windowScene: windowScene)
    let rootViewController = PaywallViewController()
    rootViewController.view.backgroundColor = .red
    window.rootViewController = rootViewController
      
    self.window = window
    window.makeKeyAndVisible()
  }

}

