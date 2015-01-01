//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Kenneth Wilcox on 1/1/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation

class SlotBrain {
  class func computeWinnings (slots: [[Slot]]) -> Int {
    var winnings = 0
    var flushWinCount = 0
    var threeOfAKindWinCount = 0
    var straightWinCount = 0
    
    for slotRow in slots {
      if checkFlush(slotRow) == true {
        println("flush")
        winnings += 1
        flushWinCount += 1
      }
      
    }
    
    if flushWinCount == slots.count {
      println("Royal Flush")
      winnings += 15
    }
    
    return winnings
  }
  
  class func checkFlush(slotRow: [Slot]) -> Bool {
    var redColorCount = 0
    var blackColorCount = 0
    
    for slot in slotRow {
      if slot.isRed {
        redColorCount++
      }
      else {
        blackColorCount++
      }
    }

    if redColorCount == slotRow.count || blackColorCount == slotRow.count {
      return true
    }
    else {
      return false
    }
  }
  
}