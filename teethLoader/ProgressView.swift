//
//  ProgressView.swift
//  JustDemo
//
//  Created by 三斗 on 5/23/16.
//  Copyright © 2016 com.streamind. All rights reserved.
//

import UIKit

protocol  viewControllerDataSource {
  func getProgress(sender:ProgressView) -> Int?
}

@IBDesignable class ProgressView: UIView {
  private let barView = UIView()
  var dataSource:viewControllerDataSource?
  
  //进度条颜色
  @IBInspectable var barColor = UIColor.blueColor(){
    didSet{
      barView.backgroundColor = barColor
    }
  }
  
  //进度条背景色
  @IBInspectable var barBgColor = UIColor.grayColor(){
    didSet{
      layer.backgroundColor = barBgColor.CGColor
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUp()
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setUp()
  }
  
  func setUp(){
    layer.backgroundColor = UIColor(red: 0/255, green: 46/255, blue: 82/255, alpha: 1).CGColor
    layer.borderColor = UIColor(red: 0/255, green: 130/255, blue: 180/255, alpha: 1).CGColor
    layer.borderWidth = 2
    barView.backgroundColor = UIColor(red: 0/255, green: 130/255, blue: 180/255, alpha: 1)
    addSubview(barView)
  }
  
  func updateUI(){
    var barFrame = bounds
    let percent = dataSource?.getProgress(self) ?? 0
    barFrame.size.width *= CGFloat(percent)/100
    barView.frame = barFrame
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  override func drawRect(rect: CGRect) {
    updateUI()
  }
  
  
  
}
