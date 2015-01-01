//
//  Factory.swift
//  SlotMachine
//
//  Created by Kenneth Wilcox on 12/31/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import Foundation
import UIKit

class Factory {
  class func createSlots() -> [[Slot]] {
    
    let kNumberOfSlots = 3
    let kNumberOfContainers = 3
    var slots: [[Slot]] = []
    
    for var containerNumber = 0; containerNumber < kNumberOfContainers; ++containerNumber {
      var slotArray:[Slot] = []
      for var slotNumber = 0; slotNumber < kNumberOfSlots; ++slotNumber {
        var slot = Slot(value: 0, image: UIImage(named:""), isRed: true)
        slotArray.append(slot)
      }
    }
    
    return slots
  }
}