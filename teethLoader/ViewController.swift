//
//  ViewController.swift
//  teethLoader
//
//  Created by 三斗 on 5/23/16.
//  Copyright © 2016 com.streamind. All rights reserved.
//

import UIKit

class ViewController: UIViewController,viewControllerDataSource {
  
  @IBOutlet weak var myProgressView: ProgressView!{
    didSet{
      myProgressView.dataSource = self
    }
  }
  @IBOutlet weak var showEnergyText: UILabel!
  
  @IBOutlet weak var showProgressView: ProgressView!{
    didSet{
      showProgressView.dataSource = self
    }
  }
  var timer = NSTimer()
  
  @IBOutlet weak var cloneText: UILabel!
  var percent = 0
  @IBOutlet weak var inCircle: UIImageView!
  var teethLoader = UIView()
  override func viewDidLoad() {
    super.viewDidLoad()
    inCircle.transform = CGAffineTransformMakeRotation(CGFloat(M_PI) * 2.5)
    timer = NSTimer.scheduledTimerWithTimeInterval(10/110, target: self, selector:#selector(ViewController.refresh), userInfo: nil, repeats: true)
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    teethLoader = TeethLoaderView(frame: CGRectMake(view.center.x - 110,view.center.y - 110,220,220))
    teethLoader.backgroundColor = UIColor.clearColor()
    teethLoader.layer.zPosition = -1
    self.view.backgroundColor = UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1)
    self.view.addSubview(teethLoader)
    
    
    UIView.animateWithDuration(5, animations: {
      self.inCircle.transform = CGAffineTransformIdentity
    }) { (finish) in
      self.cloneText.text = "CLONED DEVICE"
    }
  }
  
  func refresh(){
    percent += 2
    showProgressView.setNeedsDisplay()
    myProgressView.setNeedsDisplay()
    showEnergyText.text = "\(min(max(percent - 10/2,0),100))%"
    if percent >= 110{
      timer.invalidate()
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func changeFlag() ->Bool{
    return true
    
  }
  
  func getProgress(sender: ProgressView) -> Int? {
    if sender == showProgressView{
      return min(max(percent,0),100)
    }else{
      let fakeProgress = min(max(percent - 10,0),100)
      return fakeProgress
    }
    
  }
  
}

