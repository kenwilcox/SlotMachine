//
//  ViewController.swift
//  SlotMachine
//
//  Created by Kenneth Wilcox on 12/30/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var firstContainer: UIView!
  var secondContainer: UIView!
  var thirdContainer: UIView!
  var fourthContainer: UIView!
  
  var titleLabel: UILabel!
  
  let kMarginForView: CGFloat = 10.0
  let kSixth: CGFloat = 1.0/6.0
  
  let kNumberOfContainers = 3
  let kNumberOfSlots = 3
  let kThird:CGFloat = 1.0 / 3.0
  let kMarginForSlot:CGFloat = 2.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.setupContainerViews()
    self.setupFirstContainer(self.firstContainer)
    self.setupSecondContainer(self.secondContainer)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupContainerViews() {
    let viewWidth = self.view.bounds.width - (kMarginForView * 2)
    let viewHeight = self.view.bounds.height * kSixth
    let viewX = self.view.bounds.origin.x + kMarginForView
    var viewY = self.view.bounds.origin.y
    
    self.firstContainer = UIView(frame: CGRect(x: viewX, y: viewY, width: viewWidth, height: viewHeight))
    self.firstContainer.backgroundColor = UIColor.redColor()
    self.view.addSubview(self.firstContainer)
    
    viewY += firstContainer.frame.height
    
    self.secondContainer = UIView(frame: CGRect(x: viewX, y: viewY, width: viewWidth, height: viewHeight * 3))
    self.secondContainer.backgroundColor = UIColor.blackColor()
    self.view.addSubview(self.secondContainer)
    
    viewY += secondContainer.frame.height
    
    self.thirdContainer = UIView(frame: CGRect(x: viewX, y: viewY, width: viewWidth, height: viewHeight))
    self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
    self.view.addSubview(self.thirdContainer)
    
    viewY += thirdContainer.frame.height
    
    self.fourthContainer = UIView(frame: CGRect(x: viewX, y: viewY, width: viewWidth, height: viewHeight))
    self.fourthContainer.backgroundColor = UIColor.blackColor()
    self.view.addSubview(self.fourthContainer)
  }
  
  func setupFirstContainer(containerView: UIView) {
    self.titleLabel = UILabel()
    self.titleLabel.text = "Super Slots"
    self.titleLabel.textColor = UIColor.yellowColor()
    self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
    self.titleLabel.sizeToFit()
    self.titleLabel.center = CGPoint(x: containerView.frame.width * 0.5, y: containerView.frame.height * 0.5)
    containerView.addSubview(self.titleLabel)
  }
  
  func setupSecondContainer(containerView: UIView) {
    for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
      for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
        var slotImageView = UIImageView()
        
        slotImageView.backgroundColor = UIColor.yellowColor()
        
        slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), width: containerView.bounds.width * kThird - kMarginForSlot, height: containerView.bounds.height * kThird - kMarginForSlot)
        
        containerView.addSubview(slotImageView)
      }
    }
  }
}

