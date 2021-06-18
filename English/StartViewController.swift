//
//  StartViewController.swift
//  English
//
//  Created by 森下大地 on 2021/02/13.
//

import UIKit
import AppTrackingTransparency
import AdSupport


class StartViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // scrollViewの画面表示サイズを指定
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 1000))
        // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×(掛ける)ページ数）
        scrollView.contentSize = CGSize(width: self.view.frame.size.width*3, height: 1000)
        // scrollViewのデリゲートになる
        scrollView.delegate = self
        // メニュー単位のスクロールを可能にする
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        
        // scrollView上にUIImageViewをページ分追加する(今回は3ページ分)
        let imageView1 = createImageView(x: 0, y: 0, width: self.view.frame.size.width, height: 800, image: "image1")
        scrollView.addSubview(imageView1)
        
        let imageView2 = createImageView(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: 800, image: "image2")
        scrollView.addSubview(imageView2)
        
        let imageView3 = createImageView(x: self.view.frame.size.width*2, y: 0, width: self.view.frame.size.width, height: 800, image: "LINE_P20210307_160303085")
        scrollView.addSubview(imageView3)
        
        // pageControlの表示位置とサイズの設定
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 800, width: self.view.frame.size.width, height: 30))
        // pageControlのページ数を設定
        pageControl.numberOfPages = 3
        // pageControlのドットの色
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        // pageControlの現在のページのドットの色
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
        
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          if #available(iOS 14, *) {
              switch ATTrackingManager.trackingAuthorizationStatus {
              case .authorized:
                  print("Allow Tracking")
                  print("IDFA: \(ASIdentifierManager.shared().advertisingIdentifier)")
              case .denied:
                  print("😭拒否")
              case .restricted:
                  print("🥺制限")
              case .notDetermined:
                  showRequestTrackingAuthorizationAlert()
              @unknown default:
                  fatalError()
              }
          } else {// iOS14未満
              if ASIdentifierManager.shared().isAdvertisingTrackingEnabled {
                  print("Allow Tracking")
                  print("IDFA: \(ASIdentifierManager.shared().advertisingIdentifier)")
              } else {
                  print("🥺制限")
              }
          }
      }

      ///Alert表示
      private func showRequestTrackingAuthorizationAlert() {
          if #available(iOS 14, *) {
              ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                  switch status {
                  case .authorized:
                      print("🎉")
                      //IDFA取得
                      print("IDFA: \(ASIdentifierManager.shared().advertisingIdentifier)")
                  case .denied, .restricted, .notDetermined:
                      print("😭")
                  @unknown default:
                      fatalError()
                  }
              })
          }
      }
    
    // UIImageViewを生成
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named:  image)
        imageView.image = image
        return imageView
    }
   
    
    @IBAction func finishButton(_ sender: Any) {
        //この下の1行を追加
            self.dismiss(animated: true, completion: nil)
    }
    
}
// scrollViewのページ移動に合わせてpageControlの表示も移動させる
extension StartViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
