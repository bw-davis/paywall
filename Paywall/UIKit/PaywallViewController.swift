//
//  PaywallViewController.swift
//  Paywall
//
//  Copyright © 2020 Disney Streaming. All rights reserved.
//

import UIKit

class PaywallViewController: UIViewController {
    var paywallView = DisneyStreamingPaywallView()
    var paywallModel = DisneyStreamingPaywallDisplayModel()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = paywallView
        
        paywallView.setup(from: paywallModel)
    }
    
    func didShake() {
    // TODO: Reload the paywall whenever the shake gesture occurs
    }

}

extension PaywallViewController {
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
    if motion == .motionShake {
      didShake()
    }
  }
}
