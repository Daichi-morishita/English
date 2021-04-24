//
//  PraeParetViewController.swift
//  English
//
//  Created by 森下大地 on 2021/04/14.
//

import UIKit
import GoogleMobileAds

class PraeParetViewController: UIViewController, GADBannerViewDelegate{
    @IBOutlet weak var PraeParet: UIImageView!
    var bannerView: GADBannerView!//広告

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // In this case, we instantiate the banner with desired ad size.
        //広告
           bannerView = GADBannerView(adSize: kGADAdSizeBanner)
           addBannerViewToView(bannerView)
        //広告を読み込んで表示する
        bannerView.adUnitID = "ca-app-pub-9454016079456680/6800683581"
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
                                  toItem: bottomLayoutGuide,
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

}
