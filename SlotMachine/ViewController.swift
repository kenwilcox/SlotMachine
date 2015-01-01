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
  
  // Information labels
  var creditsLabel: UILabel!
  var betLabel: UILabel!
  var winnerPaidLabel: UILabel!
  var creditsTitleLabel: UILabel!
  var betTitleLabel: UILabel!
  var winnerPaidTitleLabel: UILabel!
  
  // Buttons in fourth container
  var resetButton: UIButton!
  var betOneButton: UIButton!
  var betMaxButton: UIButton!
  var spinButton: UIButton!
  
  var slots: [[Slot]] = []
  
  let kMarginForView: CGFloat = 10.0
  let kMarginForSlot:CGFloat = 2.0
  
  let kSixth: CGFloat = 1.0/6.0
  let kThird:CGFloat = 1.0 / 3.0
  let kHalf: CGFloat = 1.0/2.0
  let kEighth: CGFloat = 1.0/8.0
  
  let kNumberOfContainers = 3
  let kNumberOfSlots = 3

  var credits: Int = 0 {
    didSet {
      if credits != oldValue {
        self.creditsLabel.text = "\(credits)"
      }
    }
  }
  
  var currentBet: Int = -1 {
    didSet {
      if currentBet != oldValue {
        self.betLabel.text = "\(currentBet)"
      }
    }
  }
  
  var winnings: Int = -1 {
    didSet {
      if winnings != oldValue {
        self.winnerPaidLabel.text = "\(winnings)"
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.setupContainerViews()
    self.hardReset()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // IBActions
  func resetButtonPressed(button: UIButton) {
    self.hardReset()
  }
  
  func betOneButtonPressed (button: UIButton) {
    if self.credits <= 0 && self.currentBet == 0 {
      self.showAlertWithText(header: "No More Credits", message: "Reset Game")
    }
    else if self.credits == 0 {
      self.showAlertWithText(header: "No More Credits", message: "You have reached your max bet amount")
    }
    else if self.currentBet < 5 {
      self.currentBet += 1
      self.credits -= 1
    }
    else {
      self.showAlertWithText(message: "You can only bet 5 credits at a time!")
    }
  }
  
  func betMaxButtonPressed (button: UIButton) {
    // find out what maxBet is...
    var maxBet = 5
    if self.credits < 5 {
      maxBet = self.credits
    }
    
    if maxBet > 0 {
      self.credits -= maxBet
      self.currentBet += maxBet
    } else {
      showAlertWithText(message: "No more credits to bet!")
    }
  }
  
  func spinButtonPressed (button: UIButton) {
    self.slots = Factory.createSlots()
    setupSecondContainer(self.secondContainer)
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
    
    // Setup Containers
    self.setupFirstContainer(self.firstContainer)
    self.setupSecondContainer(self.secondContainer)
    self.setupThirdContainer(self.thirdContainer)
    self.setupFourthContainer(self.fourthContainer)
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
    for view in containerView.subviews{
      view.removeFromSuperview()
    }

    for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
      for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
        var slot: Slot
        var slotImageView = UIImageView()
        
        if slots.count != 0 {
          let slotContainer = slots[containerNumber]
          slot = slotContainer[slotNumber]
          slotImageView.image = slot.image
        }
        else {
          slotImageView.image = UIImage(named: "Ace")
        }
        
        slotImageView.backgroundColor = UIColor.yellowColor()
        
//        slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), width: containerView.bounds.width * kThird - kMarginForSlot, height: containerView.bounds.height * kThird - kMarginForSlot)
    
        slotImageView.frame = CGRect(x: containerView.bounds.origin.x + kMarginForSlot + ((containerView.bounds.size.width - kMarginForSlot) * CGFloat(containerNumber) / CGFloat(kNumberOfContainers)), y: containerView.bounds.origin.y + kMarginForSlot + ((containerView.bounds.size.height - kMarginForSlot) * CGFloat(slotNumber) / CGFloat(kNumberOfSlots)), width: (containerView.bounds.width - kMarginForSlot) / CGFloat(kNumberOfContainers) - kMarginForSlot, height: (containerView.bounds.height - kMarginForSlot) / CGFloat(kNumberOfSlots) - kMarginForSlot)
        
        containerView.addSubview(slotImageView)
      }
    }
    
    //println("\(containerView.subviews.count)")
  }
  
  func setupThirdContainer(containerView: UIView) {
    
    func setupLabel(label: UILabel, #position: Int, #size: Int) {
      var zeros = ""
      label.text = zeros.stringByPaddingToLength(size, withString: "0", startingAtIndex: 0)
      label.textColor = UIColor.redColor()
      label.font = UIFont(name: "Menlo-Bold", size: 16)
      label.sizeToFit()
      label.center = CGPoint(x: containerView.frame.width * kSixth * CGFloat(position * 2+1), y: containerView.frame.height * kThird)
      label.textAlignment = .Center
      label.backgroundColor = UIColor.darkGrayColor()
      containerView.addSubview(label)
    }
  
    func setupStaticLabel(label: UILabel, #text: String, #position: Int) {
      label.text = text
      label.textColor = UIColor.blackColor()
      label.font = UIFont(name: "AmericanTypewriter", size: 14)
      label.sizeToFit()
      label.center = CGPoint(x: containerView.frame.width * kSixth * CGFloat(position * 2+1), y: containerView.frame.height * kThird * 2)
      containerView.addSubview(label)
    }
    
    self.creditsLabel = UILabel()
    self.betLabel = UILabel()
    self.winnerPaidLabel = UILabel()
    
    setupLabel(self.creditsLabel, position: 0, size: 6)
    setupLabel(self.betLabel, position: 1, size: 4)
    setupLabel(self.winnerPaidLabel, position: 2, size: 6)
    
    self.creditsTitleLabel = UILabel()
    self.betTitleLabel = UILabel()
    self.winnerPaidTitleLabel = UILabel()
    
    setupStaticLabel(self.creditsTitleLabel, text: "Credits", position: 0)
    setupStaticLabel(self.betTitleLabel, text: "Bet", position: 1)
    setupStaticLabel(self.winnerPaidTitleLabel, text: "Winner Paid", position: 2)
    
  }
  
  func setupFourthContainer (containerView: UIView) {
    self.resetButton = UIButton()
    self.resetButton.setTitle("Reset", forState: .Normal)
    self.resetButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
    self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
    self.resetButton.backgroundColor = UIColor.lightGrayColor()
    self.resetButton.sizeToFit()
    self.resetButton.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf)
    self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: .TouchUpInside)
    containerView.addSubview(self.resetButton)
    
    self.betOneButton = UIButton()
    self.betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
    self.betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
    self.betOneButton.backgroundColor = UIColor.greenColor()
    self.betOneButton.sizeToFit()
    self.betOneButton.center = CGPoint(x: containerView.frame.width * 3 * kEighth, y: containerView.frame.height * kHalf)
    self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    containerView.addSubview(self.betOneButton)
    
    self.betMaxButton = UIButton()
    self.betMaxButton.setTitle("BetMax", forState: UIControlState.Normal)
    self.betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
    self.betMaxButton.backgroundColor = UIColor.redColor()
    self.betMaxButton.sizeToFit()
    self.betMaxButton.center = CGPoint(x: containerView.frame.width * 5 * kEighth, y: containerView.frame.height * kHalf)
    self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    containerView.addSubview(self.betMaxButton)
    
    self.spinButton = UIButton()
    self.spinButton.setTitle("Spin", forState: UIControlState.Normal)
    self.spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
    self.spinButton.backgroundColor = UIColor.greenColor()
    self.spinButton.sizeToFit()
    self.spinButton.center = CGPoint(x: containerView.frame.width * 7 * kEighth, y: containerView.frame.height * kHalf)
    self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
    containerView.addSubview(self.spinButton)
  }
  
  func hardReset() {
    slots.removeAll(keepCapacity: true)
    self.setupSecondContainer(self.secondContainer)
    self.credits = 4
    self.winnings = 0
    self.currentBet = 0
  }
  
  func showAlertWithText(header: String = "Warning", message: String) {
    var alert = UIAlertController(title: header, message: message, preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
  }
}

