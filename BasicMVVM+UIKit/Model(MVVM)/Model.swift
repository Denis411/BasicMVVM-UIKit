//
//  Model.swift
//  BasicMVVM+UIKit
//
//  Created by FIX PRICE on 10/16/24.
//

import Foundation

struct Model {
    private(set) var count = 0
    
    mutating func increaseCount() {
        count += 1
    }
    
    mutating func decreaseCount() {
        count -= 1
    }
}
