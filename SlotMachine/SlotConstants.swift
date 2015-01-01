//
//  SlotConstants.swift
//  SlotMachine
//
//  Created by Kenneth Wilcox on 12/31/14.
//  Copyright (c) 2014 Kenneth Wilcox. All rights reserved.
//

import Foundation
import UIKit

struct SlotConstants {
  static let allCards:[Slot] = [
    Slot(value: 1, image:UIImage(named:"Ace"), isRed: true),
    Slot(value: 2, image:UIImage(named:"Two"), isRed: true),
    Slot(value: 3, image:UIImage(named:"Three"), isRed: true),
    Slot(value: 4, image:UIImage(named:"Four"), isRed: true),
    Slot(value: 5, image:UIImage(named:"Five"), isRed: false),
    Slot(value: 6, image:UIImage(named:"Six"), isRed: false),
    Slot(value: 7, image:UIImage(named:"Seven"), isRed: true),
    Slot(value: 8, image:UIImage(named:"Eight"), isRed: false),
    Slot(value: 9, image:UIImage(named:"Nine"), isRed: false),
    Slot(value: 10, image:UIImage(named:"Ten"), isRed: true),
    Slot(value: 11, image:UIImage(named:"Jack"), isRed: false),
    Slot(value: 12, image:UIImage(named:"Queen"), isRed: true),
    Slot(value: 13, image:UIImage(named:"King"), isRed: true),
  ]
}