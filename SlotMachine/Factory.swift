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
        var slot = Factory.createSlot(slotArray)
        slotArray.append(slot)
      }
      slots.append(slotArray)
    }
    
    return slots
  }
  
  class func createSlot(currentCards: [Slot]) -> Slot {
    var currentCardValues:[Int] = []
    for slot in currentCards {
      currentCardValues.append(slot.value)
    }
    
    var randomNumber = Int(arc4random_uniform(UInt32(SlotConstants.allCards.count)))
    while contains(currentCardValues, randomNumber + 1) {
      randomNumber = Int(arc4random_uniform(UInt32(SlotConstants.allCards.count)))
    }
    //println("\(currentCardValues.count): \(randomNumber)")
    
    let card = SlotConstants.allCards[randomNumber]
    let slot = Slot(value: card.value, image: card.image, isRed: card.isRed)
    return slot
  }

}