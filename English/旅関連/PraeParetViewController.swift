//
//  PraeParetViewController.swift
//  English
//
//  Created by 森下大地 on 2021/04/14.
//

import UIKit
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

class PraeParetViewController: UIViewController, GADBannerViewDelegate{
    @IBOutlet weak var PraeParet: UIImageView!
    var bannerView: GADBannerView!//広告
    var testAdmob: Bool = false
    let id = ASIdentifierManager.shared().advertisingIdentifier.uuidString
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // In this case, we instantiate the banner with desired ad size.
        //広告
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        //広告を読み込んで表示する
        if testAdmob == true{
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        }else{
            bannerView.adUnitID = "ca-app-pub-9454016079456680/9186203579"
        }
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        //広告イベントの設定
        bannerView.delegate = self
        
    }
    
    
    //広告func
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    func requestIDFA() {
      ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
        // Tracking authorization completed. Start loading ads here.
        // loadAd()
      })
    }
    //広告func トラッキング対策
    func isAdvertisingTrackingEnabled() -> Bool {
        if #available(iOS 14, *) {
            let status = ATTrackingManager.trackingAuthorizationStatus
            switch status {
            case .notDetermined, .restricted, .denied:
                return false
            case .authorized:
                return true
            @unknown default:
                return false
            }
        } else {
            return ASIdentifierManager.shared().isAdvertisingTrackingEnabled
        }
    }
    
}
