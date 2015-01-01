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
      
      if checkInARow(slotRow) {
        println("\(slotRow.count) in a row")
        winnings += 1
        straightWinCount += 1
      }
    }
    
    if flushWinCount == slots.count {
      println("Royal Flush")
      winnings += 15
    }
    
    if straightWinCount == slots.count {
      println("Epic straight")
      winnings += 1000
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
  
  class func checkInARow(slotRow: [Slot]) -> Bool {
    var values = slotRow.map({$0.value})
    values.sort({$0 < $1})
    
    for (i, value) in enumerate(values) {
      if i > 0 && value != values[i - 1] + 1 {
        return false
      }
    }
    return true
  }
}