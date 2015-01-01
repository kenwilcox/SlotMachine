//
//  SlotMachineTests.swift
//  SlotMachineTests
//
//  Created by Kenneth Wilcox on 12/30/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import UIKit
import XCTest
import SlotMachine

class SlotMachineTests: XCTestCase {
  
  var slot1 = Slot(value: 1, image: UIImage(named: "Ace"), isRed: true)
  var slot2 = Slot(value: 2, image: UIImage(named: "Two"), isRed: true)
  var slot3 = Slot(value: 3, image: UIImage(named: "Three"), isRed: true)
  var slot4 = Slot(value: 4, image: UIImage(named: "Four"), isRed: true)
  var slot5 = Slot(value: 5, image: UIImage(named: "Five"), isRed: false)
  var slot6 = Slot(value: 6, image: UIImage(named: "Six"), isRed: false)
  var slot7 = Slot(value: 7, image: UIImage(named: "Seven"), isRed: true)
  var slot8 = Slot(value: 8, image: UIImage(named: "Eight"), isRed: false)
  var slot9 = Slot(value: 9, image: UIImage(named: "Nine"), isRed: false)
  var slot10 = Slot(value: 10, image: UIImage(named: "Ten"), isRed: true)
  var slot11 = Slot(value: 11, image: UIImage(named: "Jack"), isRed: false)
  var slot12 = Slot(value: 12, image: UIImage(named: "Queen"), isRed: false)
  var slot13 = Slot(value: 13, image: UIImage(named: "King"), isRed: true)
  
  func testSlotBrainCheckFlushIsFlushRed() {
    
    let slots = [slot1, slot2, slot3]
    XCTAssertTrue(SlotBrain.checkFlush(slots), "Pass: is red flush")
    
  }
  
  func testSlotBrainCheckFlushIsFlushBlack() {
    
    let slots = [slot5, slot6, slot8]
    XCTAssertTrue(SlotBrain.checkFlush(slots), "Pass: is black flush")
    
  }
  
  func testSlotBrainCheckFlushIsNotFlush () {
    
    let slots = [slot1, slot2, slot5]
    XCTAssertFalse(SlotBrain.checkFlush(slots), "Pass: is not a flush")
  }
  
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    func testExample() {
//        // This is an example of a functional test case.
//        XCTAssert(true, "Pass")
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
